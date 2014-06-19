require 'Dashingstate'
require 'csv'

def to_bool(str)
  str == 'true'
end

SCHEDULER.every '15s', allow_overlapping: false do |job|
  values = []
  labels = []
  # read out the objectnames and the range of the tiles
  names = CSV.read("/path/to/names.csv")  
  range = CSV.read("/path/to/range.csv")
  i = 0
  range.each do |item|
  z = 0
    item.each do |it|
      it = it.to_i
      range[i][z] = it
      z += 1
    end
  i += 1
  end
  # Gets the correct range of the tiles
  xaxdr = [range[0][0],range[0][1]]
  mailr = [range[1][0],range[1][1]]
  netwr = [range[2][0],range[2][1]]
  versr = [range[3][0],range[3][1]]
  i = 0
  # Gets all status
  names.each do |item|
    labels << [names[i][0]]
    isgroup = to_bool(item[3])
    isetc = item[4]
    values[i] = Status.getstate(item[1],item[2],isgroup,isetc)
	i += 1
  end


  # prepares all data 
  xaxd = Status.prepare(labels[xaxdr[0],xaxdr[1]],values[xaxdr[0],xaxdr[1]])
  mail = Status.prepare(labels[mailr[0],mailr[1]],values[mailr[0],mailr[1]])
  network = Status.prepare(labels[netwr[0],netwr[1]],values[netwr[0],netwr[1]])
  versch = Status.prepare(labels[versr[0],versr[1]],values[versr[0],versr[1]])

  # sends all data to the widgets
  send_event('xaxd', {items:xaxd[0,xaxdr[1]], status:xaxd[-1]})
  send_event('mail', {items:mail[0,mailr[1]], status:mail[-1]})
  send_event('network', {items:network[0,netwr[1]], status:network[-1]})
  send_event('versch', {items:versch[0,versr[1]], status:versch[-1]})
end

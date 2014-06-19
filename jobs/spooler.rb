SCHEDULER.every '30s', :first_in => 0 do |job|
  res = `python /root/status.py services perf_data 'host_name = NameOfSpoolServer'`.gsub!("\n\n","").split(";")
  spool = res[9].split(/TotalPagesPrinted'=(.*)/)
  spool = spool[1].to_i
  if spool > 10000 then
  spool = spool.to_s.insert(2, ".")
  elsif spool > 1000 then
  spool = spool.to_s.insert(1, ".")
  end
  send_event('', text:spool)
end

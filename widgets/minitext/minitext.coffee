class Dashing.Minitext extends Dashing.Widget

  onData: (data) ->
    if data.id == "tickets"
      seticon = undefined
      tickets = undefined
      seticon = (art) ->
        $(".icon-tickets").remove().after ".tickets"
        $("<i class=\"icon-" + art + " icon-backgroundtickets icon-tickets\"></i>").insertAfter ".tickets"
      
      tickets = data.text.split(":")
      tickets[0] = parseInt(tickets[0])
      tickets[1] = parseInt(tickets[1])
      if tickets[0] >= tickets[1]
        $(".icon-tickets").remove().after ".tickets"
        $("<i class=\"icon-thumbs-up icon-ticketsup icon-tickets\"></i>").insertAfter ".tickets"
      else
        $(".icon-tickets").remove().after ".tickets"
        $("<i class=\"icon-thumbs-down icon-ticketsdown icon-tickets\"></i>").insertAfter ".tickets"

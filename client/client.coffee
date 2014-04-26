if Meteor.isClient

    addEvent = (options) ->
        Meteor.call "addEvent", options
        return

    Template.eventdisplay.list = ->
        Events.find {}

    Template.eventinput.rendered = ->
        $(".datetimepicker").datetimepicker()

    Template.eventinput.events submit: (e) ->
        e.preventDefault()
        #Events.insert({timestamp:$("#timestamp").val(), log:$("#log").val()})
        addEvent ({timestamp: new Date($("#timestamp").val()), log:$("#log").val()})
        $("#timestamp").val('')
        $("#log").val('')

if Meteor.isClient

    console.log Meteor.userId()
    Meteor.subscribe "events", Meteor.userId()

    addEvent = (options) ->
        Meteor.call "addEvent", options
        return

    Template.eventdisplay.list = ->
        Events.find {}

    Template.eventinput.rendered = ->
        $(".datetimepicker").datetimepicker()

    Template.eventinput.events submit: (e) ->
        e.preventDefault()
        addEvent ({timestamp: new Date($("#timestamp").val()), log:$("#log").val()})
        $("#timestamp").val('')
        $("#log").val('')

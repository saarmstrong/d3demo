if Meteor.isClient

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

    Template.usersms.events submit: (e) ->
        e.preventDefault()
        Meteor.users.update({_id:Meteor.user()._id}, {$set:{"profile.sms": $("#sms").val()}})

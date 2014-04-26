if Meteor.isServer

    Meteor.publish "events", (user) ->
      Events.find userId: user

    Meteor.methods addEvent: (options) ->
        console.log Meteor.userId()
        Events.insert
            userId: Meteor.userId()
            timestamp: options.timestamp
            log: options.log

        return

    Meteor.startup ->
        ###
        if Events.find().count() is 0
            events = [
                {
                    timestamp: new Date("April 22, 2014 12:30:00")
                    log: "Walked the Dog 2 Miles"
                }
                {
                    timestamp: new Date("April 22, 2014 14:30:00")
                    log: "Ate 2 Burritos"
                }
            ]
            i = 0

            while i < events.length
                Events.insert events[i]
                i++
        return
        ###


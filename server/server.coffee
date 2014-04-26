if Meteor.isServer

    Meteor.methods addEvent: (options) ->
        Events.insert
            timestamp: options.timestamp
            log: options.log

        return

    Meteor.startup ->
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


if Meteor.isServer

    Speak = Meteor.require('speakeasy-nlp')

    Meteor.publish "events", (user) ->
      Events.find
        userId: user

    Meteor.methods addEvent: (options) ->

        options.userId = Meteor.userId() unless "userId" of options

        false  unless options.userId?

        parsed = Speak.classify options.log
        Events.insert
            userId: options.userId
            timestamp: options.timestamp
            log: options.log
            verbs: parsed.verbs
            nouns: parsed.nouns
            tokens: parsed.tokens

        return

    Router.map ->
        @route "apiSMS",
        path: "/api/sms"
        where: "server"
        action: (res) ->
            User = Meteor.users.findOne({'profile.sms': @request.body.From})
            Meteor.call "addEvent", {userId: User._id, log: @request.body.Body, timestamp: new Date() } if User

    Meteor.startup ->


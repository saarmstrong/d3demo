if Meteor.isServer

    Speak = Meteor.require('speakeasy-nlp')

    Meteor.publish "events", (user) ->
      Events.find
        userId: user

    Meteor.methods addEvent: (options) ->
        parsed = Speak.classify options.log
        Events.insert
            userId: Meteor.userId()
            timestamp: options.timestamp
            log: options.log
            verbs: parsed.verbs
            nouns: parsed.nouns
            tokens: parsed.tokens

        return

    Meteor.startup ->


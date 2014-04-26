@Events = new Meteor.Collection("events")

Events.allow insert: () ->
    false

# load dispatcher
{EventDispatcher} = require '../../dispatcher.coffee'

# define your event
class PersonEvent
    success: no
    title: no
    name: no

    constructor: (@title, @name) ->
        title = @title
        name = @name

# create instance of event
event = new PersonEvent 'Sir', 'John'

# register listeners
EventDispatcher.listen 'my.first.event', (event) ->
    console.log "Hello #{event.title} #{event.name}!"
    event

EventDispatcher.listen 'my.first.event', (event) ->
    console.log "Hello again #{event.title} #{event.name}!"
    off # if you want to stop event propagation - do not
        # return event and propagation will stop.

EventDispatcher.listen 'my.first.event', (event) ->
    console.log "The end"
    event.success = yes
    event


# fire event and get it back (updated)
event = EventDispatcher.dispatch 'my.first.event', event

# check if event propagation was complete
console.log "Success? " + if event then event.success else no

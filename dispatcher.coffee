class EventDispatcher
    @listeners: {}

    @add_listener: (event_name, callback) ->
        return no if not event_name or not callback

        @listeners[event_name] = [] if not @listeners[event_name]
        @listeners[event_name].push callback
        yes

    @fire_event: (event_name, event) ->
        return event if not @listeners[event_name]

        event = callback event for callback in @listeners[event_name]
        event

class EventDispatcher
    @listeners: {}

    @listen: (event_name, callback) ->
        return no if not event_name? or not callback?

        @listeners[event_name] = [] if not @listeners[event_name]
        @listeners[event_name].push callback
        yes

    @dispatch: (event_name, event) ->
        return event if not @listeners[event_name]?

        for callback in @listeners[event_name]
            event = callback event
            break if not event?

        event

exports.EventDispatcher = EventDispatcher

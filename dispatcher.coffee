class EventDispatcher
    @listeners: {}

    @listen: (event_name, callback, priority) ->
        return no if not event_name? or not callback?

        @listeners[event_name] = [] if not @listeners[event_name]
        @listeners[event_name].push callback: callback, priority: priority
        yes

    @dispatch: (event_name, event) ->
        return event if not @listeners[event_name]?

        @listeners[event_name].sort (a, b) ->
            return -1 if a.priority > b.priority
            return 1 if b.priority > a.priority
            return 0

        for pair in @listeners[event_name]
            break if not event
            event = pair.callback event

        event

exports.EventDispatcher = EventDispatcher

brujo_dash = rc require('../scenes/brujo_dash.coffee').default

render = ->
    { ww, wh } = @props
    brujo_dash { ww, wh }

comp = rr
    render: render

map_state_to_props = (state) ->
    {}

map_dispatch_to_props = (dispatch) ->
    {}

exports.default = connect(map_state_to_props, map_dispatch_to_props)(comp)

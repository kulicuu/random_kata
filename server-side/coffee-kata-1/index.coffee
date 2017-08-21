



kata_api = {}



setup_and_load = ->





keys_kata_api = _.keys kata_api


kata_api_fncn = ({ type, payload, spark }) ->
    if _.includes(keys_kata_api, type)
        kata_api[type] { payload, spark }
    else
        c "#{color.yellow('no-op in kata-api.', on)}"








exports.default = kata_api_fncn



setup_and_load()

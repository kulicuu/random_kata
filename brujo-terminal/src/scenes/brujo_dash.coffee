



authors_table = ( props, state ) ->



books_table = ( props, state ) ->
    div
        style:
            display: 'flex'
            backgroundColor: 'magenta'

        div
            style:
                backgroundColor: 'grey'
                display: 'flex'
                flexDirection: 'column'
                flexWrap: 'no-wrap'
                width: '100%'
            div
                style:
                    display: 'flex'
                    flexDirection: 'row'
                    flexGrow: 0
                div
                    style:
                        overflow: 'hidden'
                        whiteSpace: 'nowrap'
                        textOverflow: 'ellipsis'
                        paddingRight: 20
                    "Title"
                div
                    style:
                        overflow: 'hidden'
                        whiteSpace: 'nowrap'
                        textOverflow: 'ellipsis'
                        paddingRight: 20
                    "ISBN"
                div
                    style:
                        overflow: 'hidden'
                        whiteSpace: 'nowrap'
                        textOverflow: 'ellipsis'
                        paddingRight: 20
                    "Authors"
                div
                    style:
                        overflow: 'hidden'
                        whiteSpace: 'nowrap'
                        textOverflow: 'ellipsis'
                        paddingRight: 20
                    "Description"
            for isbn, book of props.books
                # do (isbn, book) ->
                if isbn isnt 'isbn'
                    { title, isbn, authors, description }  = book
                    div
                        key: "book:#{isbn}"
                        style:
                            display: 'flex'
                            flexDirection: 'row'
                            flexGrow: 0
                            fontSize: 8
                        div
                            style:
                                overflow: 'hidden'
                                whiteSpace: 'nowrap'
                                textOverflow: 'ellipsis'
                                paddingRight: 20
                            title
                        div
                            style:
                                overflow: 'hidden'
                                whiteSpace: 'nowrap'
                                textOverflow: 'ellipsis'
                                paddingRight: 20
                            isbn
                        div
                            style:
                                overflow: 'hidden'
                                whiteSpace: 'nowrap'
                                textOverflow: 'ellipsis'
                                paddingRight: 20
                            authors
                        div
                            style:
                                overflow: 'hidden'
                                whiteSpace: 'nowrap'
                                textOverflow: 'ellipsis'
                                paddingRight: 20
                            description



comp = rr

    getInitialState: ->
        # dctn_selected: 'null'
        # algo_selected: 'null'
        {}



    componentWillMount: ->
        # c 'okay'
        # @props.get_raw_dctns_list()
        @props.get_books()
        @props.get_authors()





    render: ->
        # c @props.books
        div
            style:
                display: 'flex'
                flexDirection: 'column'
                # alignItems: 'center'
                # justifyContent: 'center'
                backgroundColor: 'lightsteelblue'
                height: '100%'
                width: '100%'
            h6 null, 'books'
            books_table @props, @state

            h6 null, 'authors'
            authors_table @props, @state









map_state_to_props = (state) ->
    state.get('lookup').toJS()

map_dispatch_to_props = (dispatch) ->

    get_authors: ->
        dispatch
            type: 'get_authors_and_magazines'

    get_books: ->
        dispatch
            type: 'get_books'


    # apply_parse_build_data_structure: (filename, algo_name) ->
    #     dispatch
    #         type: 'apply_parse_build_data_structure'
    #         payload:
    #             filename: filename
    #             algo_name: algo_name
    #
    # browse_dctn: (filename) ->
    #     dispatch
    #         type: 'browse_dctn'
    #         payload:
    #             filename: filename
    #
    # get_raw_dctns_list: ->
    #     dispatch
    #         type: 'get_raw_dctns_list'
    #
    #
    # change_to_autocomplete_mode: ->
    #     dispatch
    #         type: 'change_to_autocomplete_mode'
    #
    # change_to_spellcheck_mode: ->
    #     dispatch
    #         type: 'change_to_spellcheck_mode'
    #
    #
    # lookup_prefix: ({ payload }) ->
    #     dispatch
    #         type: 'lookup_prefix'
    #         payload: payload
    #
    # placeholder: ({ payload }) ->
    #     dispatch
    #         type: 'placeholder'


exports.default = connect(map_state_to_props, map_dispatch_to_props)(comp)

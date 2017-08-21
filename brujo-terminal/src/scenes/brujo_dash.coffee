
keys_books = null
keys_mags = null







find_book_or_mag_pane = ( props, state, setState ) ->
    div
        style:
            display: 'flex'
            backgroundColor: 'lightgrey'
        input
            type: 'text'
            placeholder: 'isbn'
            onChange: (e) ->
                candide_isbn = e.currentTarget.value
                len = candide_isbn.length
                # c keys_mags, 'mags`'
                # c keys_books, 'books'
                total_rayy = keys_mags.concat keys_books
                c total_rayy
                books_matches = _.reduce keys_books, (acc, v, idx) ->
                    c acc, v, idx
                    if v.substring(0, len) is candide_isbn
                        acc.push props.books[v]
                        acc
                    else
                        acc
                , []
                mags_matches = _.reduce keys_mags, (acc, v, idx) ->
                    if v.substring(0, len) is candide_isbn
                        acc.push props.magazines[v]
                        acc
                    else
                        acc
                , []

                c mags_matches
                c books_matches
                setState
                    mags_matches: mags_matches
                    books_matches: books_matches


        div
            style:
                display: 'flex'
            h6
                style:
                    fontSize: 8
                'magazine matches'
            for mag, idx in state.mags_matches
                p
                    key: "book_match#{idx}"
                    style:
                        fontSize: 7
                    mag.title
            h6
                style:
                    fontSize: 8
                'book matches'
            for book, idx in state.books_matches
                p
                    key: "book_match#{idx}"
                    style:
                        fontSize: 7
                    book.title




magazines_table = ( props, state ) ->
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
                    "Authors"
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
                    "Published at"
            for isbn, mag of props.magazines
                if isbn isnt 'isbn'
                    { authors, isbn, publishedAt, title }  = mag
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
                            authors
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
                            publishedAt



authors_table = ( props, state ) ->
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
                    "First Name"
                div
                    style:
                        overflow: 'hidden'
                        whiteSpace: 'nowrap'
                        textOverflow: 'ellipsis'
                        paddingRight: 20
                    "Last Name"
                div
                    style:
                        overflow: 'hidden'
                        whiteSpace: 'nowrap'
                        textOverflow: 'ellipsis'
                        paddingRight: 20
                    "Email"
            for email, author of props.authors
                if email isnt 'email'
                    { email, firstname, lastname }  = author
                    div
                        key: "book:#{email}"
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
                            firstname
                        div
                            style:
                                overflow: 'hidden'
                                whiteSpace: 'nowrap'
                                textOverflow: 'ellipsis'
                                paddingRight: 20
                            lastname
                        div
                            style:
                                overflow: 'hidden'
                                whiteSpace: 'nowrap'
                                textOverflow: 'ellipsis'
                                paddingRight: 20
                            email



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

    componentWillReceiveProps: (props, state) ->
        if _.includes(_.keys(props), 'books')
            keys_books = _.keys(props.books)
        if _.includes(_.keys(props), 'magazines')
            keys_mags = _.keys(props.magazines)




    getInitialState: ->
        mags_matches: []
        books_matches: []



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

            h6 null, 'magazines'
            magazines_table @props, @state

            h6 null, 'find book or mag'
            find_book_or_mag_pane @props, @state, @setState.bind(@)









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

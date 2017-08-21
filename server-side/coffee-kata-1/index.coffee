
pack =
    authors: {}
    books: {}
    magazines: {}


kata_api = {}

kata_api['get_authors_and_magazines'] = ({ spark }) ->
    spark.write
        type: 'get_authors_and_magazines_response'
        payload:
            authors: pack.authors
            magazines: pack.magazines

kata_api.get_books = ({ spark }) ->
    spark.write
        type: 'get_books_response'
        payload: pack.books


keys_kata_api = _.keys kata_api


kata_api_fncn = ({ type, payload, spark }) ->
    if _.includes(keys_kata_api, type)
        kata_api[type] { payload, spark }
    else
        c "#{color.yellow('no-op in kata-api.', on)}"








exports.default = kata_api_fncn



loader_api = {}



loader_api.authors = ({ blob }) ->
    # c blob
    authors_rayy = blob.split '\n'
    _.map authors_rayy, (val, k) ->
        [ email, firstname, lastname ] = val.split(';')
        pack.authors[email] =
            email: email
            firstname: firstname
            lastname: lastname

loader_api.books = ({ blob }) ->
    books_rayy = blob.split '\n'
    _.map books_rayy, (val, idx) ->
        [ title, isbn, authors, description ] = val.split(';')
        pack.books[isbn] =
            isbn: isbn
            title: title
            authors: authors
            description: description


loader_api.magazines = ({ blob }) ->
    magazines_rayy = blob.split '\n'
    _.map magazines_rayy, (val, idx) ->
        c val
        [ title, isbn, authors, publishedAt ] = val.split(';')
        pack.magazines[isbn] =
            isbn: isbn
            title: title
            authors: authors
            publishedAt: publishedAt


setup_and_load = ->

    control_flow.each ['authors.csv', 'books.csv', 'magazines.csv'], (filename, cb) ->
        fs.readFileAsync path.resolve(__dirname, 'resources', filename), 'utf8'
        .then (blob) ->
            name = filename.split('.')[0]
            pack[filename] = blob
            loader_api[name] { blob }
            cb null
    , (err, results) ->
        c err
        # c pack
        # c results


setup_and_load()

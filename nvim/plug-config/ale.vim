let g:ale_disable_lsp = 1

let g:ale_linters = {
            \'*': ['remove_trailing_lines', 'trim_whitespace'],
            \'clojure': ['clj-kondo']
            \}

let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace']}

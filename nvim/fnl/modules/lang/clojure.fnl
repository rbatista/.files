(module modules.lang.clojure
  {autoload {nvim aniseed.nvim}})

(defn plugins
  [use]
  (use :Olical/conjure {})
  (use :m00qek/baleia.nvim {:tag "v1.2.0"}) ; colorize ANSI
  (use :guns/vim-sexp {})
  (use :tpope/vim-sexp-mappings-for-regular-people {}))

(defn- setup-baleia-conjure-logs
  []
  (nvim.ex.autocmd "BufWinEnter conjure-log-* call g:baleia.automatically(bufnr('%'))"))

(defn setup []
  (set nvim.g.sexp_filetypes "clojure,scheme,lisp,timl,fennel,janet")
  (set nvim.g.sexp_mappings
       {:sexp_outer_list                "af"
        :sexp_inner_list                "if"
        :sexp_outer_top_list            "aF"
        :sexp_inner_top_list            "iF"
        :sexp_outer_string              "as"
        :sexp_inner_string              "is"
        :sexp_outer_element             "ae"
        :sexp_inner_element             "ie"
        :sexp_move_to_prev_bracket      "("
        :sexp_move_to_next_bracket      ")"
        :sexp_indent_top                "=-"
        :sexp_round_head_wrap_element   "<Leader>W"
        :sexp_swap_element_backward     "<Leader>T"
        :sexp_swap_element_forward      "<Leader>t"
        :sexp_raise_element             "<LocalLeader>O"
        :sexp_emit_head_element         "<Leader>{"
        :sexp_emit_tail_element         "<Leader>}"
        :sexp_capture_prev_element      "<Leader>["
        :sexp_capture_next_element      "<Leader>]"
        :sexp_flow_to_next_open_bracket "<M-f>"
        :sexp_flow_to_prev_open_bracket "<M-b>"})

  (set nvim.g.conjure#mapping#doc_word "K")
  (set nvim.g.conjure#log#strip_ansi_escape_sequences_line_limit 0)

  (let [(ok? baleia) (pcall #(require :baleia))]
    (when (not ok?)
      (print (.. "config error: " baleia)))
    (when ok?
      (set nvim.g.baleia (baleia.setup {:line_starts_at 3}))
      (setup-baleia-conjure-logs))))

(module modules.autocomplete
  {autoload {nvim aniseed.nvim}})

(defn plugins
  [use]
  (use :hrsh7th/nvim-cmp {:requires [:hrsh7th/cmp-buffer
                                     :hrsh7th/cmp-nvim-lsp
                                     :PaterJason/cmp-conjure]}))

(def- cmp-src-menu-items
  {:buffer   "buff"
   :conjure  "conj"
   :nvim_lsp "lsp"})

(def- cmp-srcs
  [{:name :nvim_lsp}
   {:name :conjure}
   {:name :buffer}])

(fn has-words-before []
  (let [(line col) (unpack (vim.api.nvim_win_get_cursor 0))]
    (and (not= col 0)
         (= (: (: (. (vim.api.nvim_buf_get_lines 0 (- line 1) line true) 1) :sub col col) :match "%s") nil))))

(defn setup
  []
  (let [(ok? cmp) (pcall #(require :cmp))]
    (when ok?
      (cmp.setup
        {:formatting
         {:format (fn [entry item]
                    (set item.menu (or (. cmp-src-menu-items entry.source.name) ""))
                    item)}
          :mapping {:<C-p> (cmp.mapping.select_prev_item)
                    :<C-n> (cmp.mapping.select_next_item)
                    :<C-b> (cmp.mapping.scroll_docs (- 4))
                    :<C-f> (cmp.mapping.scroll_docs 4)
                    :<C-Space> (cmp.mapping.complete)
                    :<C-e> (cmp.mapping.close)
                    :<CR> (cmp.mapping.confirm {:behavior cmp.ConfirmBehavior.Insert
                                                :select true})
                    :<Tab> (cmp.mapping (fn [fallback]
                                            (if
                                              (cmp.visible) (cmp.select_next_item)
                                              (has-words-before) (cmp.complete)
                                              :else (fallback)))
                                          {1 :i 2 :s})
                    :<S-Tab> (cmp.mapping (fn [fallback]
                                            (if
                                              (cmp.visible) (cmp.select_prev_item)
                                              :else (fallback)))
                                          {1 :i 2 :s})}
          :sources cmp-srcs}))))

(module modules.autocomplete
  {autoload {nvim aniseed.nvim}})

(defn plugins
  [use]
  (use :hrsh7th/nvim-cmp {:requires [:hrsh7th/cmp-buffer
                                     :hrsh7th/cmp-nvim-lsp
                                     :PaterJason/cmp-conjure]}))

(def- cmp-src-menu-items
  {:buffer "buff"
   :conjure "conj"
   :nvim_lsp "lsp"})

(def- cmp-srcs
  [{:name :nvim_lsp}
   {:name :conjure}
   {:name :buffer}])

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
                                               :select true})}
          :sources cmp-srcs}))))

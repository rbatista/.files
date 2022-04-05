(module plugins
  {autoload {core aniseed.core
             packer packer}})

(defn maybe-require
  [custom-ns]
  (when custom-ns
      (require custom-ns)))

(defn import-plugin
  [use name opts]
  (let [custom (. opts :custom)
        opts-wo-custom (tset opts :custom nil)]
    (use (core.assoc opts 1 name)) ; put plugin as first position
    (maybe-require custom)))

(defn import-plugins [use plugins]
  "Iterate over the package list extracting pairs (name, opts)
  and call use from packer for each plugin, it also require
  the namespace from ':custom' key to do some kind of setup (deprecated: prefer modules instead)"
  (each [name opts (pairs plugins)]
    (print name)
    (print opts)
    ;(import-plugin use name opts)
    ))

(defn import-modules [use modules]
  (each [index m (ipairs modules)]
    (let [(ok? plugin) (pcall #(require m))]
      (print ok?)
      (print plugin)
      (when ok?
        ;(-?> plugin (.plugins (partial import-plugin use)))
        ))))

; List of tuples where the first element is the user/repo as keyword and
; the second elementt is the packer options
(def plugins
  [{:wbthomason/packer.nvim {}}
   {:Olical/aniseed {}}
   {:jiangmiao/auto-pairs {:custom :plugins.auto-pairs}}

   ; clojure
   {:guns/vim-sexp {}}
   {:tpope/vim-sexp-mappings-for-regular-people {}}
   {:tpope/vim-repeat {}}
   {:tpope/vim-surround {}}

   {:kien/rainbow_parentheses.vim {}}

   {:marko-cerovac/material.nvim {:custom :theme}}])

(def modules
  [:plugins.treesitter])

;(packer.startup
;  (fn [use]
    ;(import-plugins use plugins)
    ;(import-modules use modules)
;    ))

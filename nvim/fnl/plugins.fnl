(module plugins
  {autoload {core aniseed.core}})

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
  (each [_ plugin (ipairs plugins)]
    (let [name (. plugin 1)
          opts (. plugin 2)]
    (import-plugin use name opts))))

(defn import-modules [use modules]
  (each [_ module-ns (ipairs modules)]
    (print module-ns)
    (let [mod (require module-ns)]
      (when mod
        (mod.plugins (partial import-plugin use))
        ))))

; List of tuples where the first element is the user/repo as keyword and
; the second elementt is the packer options
(def plugins
  [[:wbthomason/packer.nvim {}]
   [:Olical/aniseed {}]
   [:jiangmiao/auto-pairs {:custom :plugins.auto-pairs}]

   ; clojure
   [:guns/vim-sexp {}]
   [:tpope/vim-sexp-mappings-for-regular-people {}]
   [:tpope/vim-repeat {}]
   [:tpope/vim-surround {}]

   [:kien/rainbow_parentheses.vim {}]

   [:marko-cerovac/material.nvim {:custom :theme}]])

(def modules
  [:modules.treesitter])

(def packer (require :packer))

(packer.startup
  (fn [use]
    (import-plugins use plugins)
    (import-modules use modules)
    ))

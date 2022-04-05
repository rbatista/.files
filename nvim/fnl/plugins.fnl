(module plugins
  {autoload {core aniseed.core
             packer packer}})

(defn maybe-require
  [custom-ns]
  (when custom-ns
      (require custom-ns)))

(defn import-plugin
  [packer-use name opts]
  (let [custom (. opts :custom)
        opts-wo-custom (tset opts :custom nil)]
    (packer-use (core.assoc opts 1 name)) ; put plugin as first position
    (maybe-require custom)))

(defn use [...]
  "Iterate over the package list extracting pairs (name, opts), call
  packer startup, and call use from packer for each plugin, also requiring
  the namespace from ':custom' key"
  (let [pkgs [...] ; declare vararg to be used on inner function
        size (core.count pkgs)
        step 2]
    (packer.startup
      (fn [puse]
        (for [index 1 size step]
          (let [name (. pkgs index)
                opts (. pkgs (+ index 1))]
            (import-plugin puse name opts)))))))

(use :wbthomason/packer.nvim {}
     :Olical/aniseed {}
     :jiangmiao/auto-pairs {:custom :plugins.auto-pairs}

     ; clojure
     :guns/vim-sexp {}
     :tpope/vim-sexp-mappings-for-regular-people {}
     :tpope/vim-repeat {}
     :tpope/vim-surround {}

     :kien/rainbow_parentheses.vim {}

     :marko-cerovac/material.nvim {:custom :theme}

     :nvim-treesitter/nvim-treesitter {:run ":TSUpdate" :custom :plugins.treesitter})

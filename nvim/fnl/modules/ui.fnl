(module modules.ui
  {autoload {core anissed.core
             nvim aniseed.nvim}})

(defn plugins
  [use]
  (use :marko-cerovac/material.nvim {})
  (use :lukas-reineke/indent-blankline.nvim {})
  (use :kyazdani42/nvim-web-devicons {})
  (use :kyazdani42/nvim-tree.lua {})
  (use :akinsho/bufferline.nvim {})
  (use :nvim-lualine/lualine.nvim {}))

(defn- setup-colorscheme
  []
  (let [(ok? material) (pcall #(require :material))]
    (when ok?
      (material.setup
        {:custom_highlights {:FloatBorder {:fg "#1A1A1A"}}
         :borders true
         :high_visibility {:darker true}
         :styles {:comments {:italic true}}})

      (set nvim.g.material_style :palenight)
      (nvim.ex.colorscheme :material))))

(defn- setup-identline
  []
  (let [(ok? blankline) (pcall #(require :indent_blankline))]
    (when ok?
      (blankline.setup
        {:show_first_indent_level false
         :use_treesitter true
         :show_end_of_line true
         :buftype_exclude ["terminal" "nofile"]})

      (set nvim.g.material_style :palenight)
      (nvim.ex.colorscheme :material))))

(defn lsp_connection []
  (if (vim.tbl_isempty (vim.lsp.buf_get_clients 0)) "" ""))

(defn setup-statusline
  []
  (let [(ok? lualine) (pcall #(require :lualine))]
    (when ok?
      (lualine.setup
        {:options {:theme :palenight
                   :disabled_filetypes ["alpha" "dashboard" "NvimTree" "Outline"]}
         :sections {:lualine_x [[:diagnostics {:sections [:error
                                                    :warn
                                                    :info
                                                    :hint]
                                         :sources [:nvim_lsp]}]
                          [lsp_connection]
                          :location
                          :filetype]
                    :lualine_y [:encoding]}}))))

(defn- setup-buffer-line
  []
  (let [(ok? bufferline) (pcall #(require :bufferline))]
    (when ok?
      (bufferline.setup 
        {:options
         {;:name_formatter bufferline-name-formatter
          :offsets [{:filetype "NvimTree"
                     :text ""
                     :padding 1}]}}))))

(defn- setup-autoclose-tree
  []
  (nvim.ex.autocmd "BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif"))

(defn- setup-tree-keymap
  []
  (nvim.set_keymap :n :<leader>tt ":NvimTreeToggle<CR>" {:noremap true})
  (nvim.set_keymap :n :<leader>tr ":NvimTreeFindFile<CR>" {:noremap true}))

(defn- setup-nvim-tree
  []
  (let [(ok? nvim_tree) (pcall #(require :nvim-tree))
        (conf-ok? conf) (pcall #(require :nvim-tree.config))]
    (when (and ok? conf-ok?)
      (let [tree-cb conf.nvim_tree_callback]
        (nvim_tree.setup
          {:ignore_ft_on_setup ["startify" "dashboard" "alpha"]
           :diagnostics {:enable false}
           :git {:enable true}
           :actions {:open_file {:quit_on_open true}}
           :view {:hide_root_folder false
                  :mappings {:custom_only false
                             :list [{:key ["l" "<CR>" "o"] :cb (tree-cb "edit")}
                                    {:key "h" :cb (tree-cb "close_node")}
                                    {:key "v" :cb (tree-cb "vsplit")}]}}}))
      (setup-tree-keymap)
      (setup-autoclose-tree))))

(defn setup
  []
  (setup-colorscheme)
  (setup-identline)
  (setup-statusline)
  (setup-buffer-line)
  (setup-nvim-tree))

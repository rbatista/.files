(module modules.ui
  {autoload {core anissed.core
             nvim aniseed.nvim}})

(defn plugins
  [use]
  (use :marko-cerovac/material.nvim {})
  (use :lukas-reineke/indent-blankline.nvim {})
  (use :nvim-lualine/lualine.nvim {:requires :kyazdani42/nvim-web-devicons}))

(defn- setup-colorscheme
  []
  (let [(ok? material) (pcall #(require :material))]
    (when ok?
      (material.setup
        {:custom_highlights {:FloatBorder "#1A1A1A"}
         :borders true
         :high_visibility {:darker true}
         :italics {:comments true}})

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

(defn setup
  []
  (setup-colorscheme)
  (setup-identline)
  (setup-statusline))

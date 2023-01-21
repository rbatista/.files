(module modules.lsp
  {autoload {nvim aniseed.nvim
             core aniseed.core}})

(defn plugins
  [use]
  (use :neovim/nvim-lspconfig
    ; colorize diagnostics
    {:requires [:folke/lsp-colors.nvim
                :folke/trouble.nvim]}))

;https://github.com/rafaeldelboni/nvim-fennel-lsp-conjure-as-clojure-ide/blob/main/.config/nvim/fnl/config/plugin/lspconfig.fnl

;symbols to show for lsp diagnostics
(defn define-signs
  [prefix]
  (let [error (.. prefix "SignError")
        warn  (.. prefix "SignWarn")
        info  (.. prefix "SignInfo")
        hint  (.. prefix "SignHint")]
  (vim.fn.sign_define error {:text "" :texthl error})
  (vim.fn.sign_define warn  {:text "" :texthl warn})
  (vim.fn.sign_define info  {:text "" :texthl info})
  (vim.fn.sign_define hint  {:text "" :texthl hint})))

(defn- lsp-diagnostic
  []
  (vim.lsp.with
    vim.lsp.diagnostic.on_publish_diagnostics
    {:severity_sort true
     :update_in_insert false
     :underline true
     :virtual_text false}))

(defn- lsp-hover
  []
  (vim.lsp.with
    vim.lsp.handlers.hover
    {:border "rounded"}))

(defn- signature-help
  []
  (vim.lsp.with
    vim.lsp.handlers.signature_help
    {:border "single"}))

(defn- on_attach
  [client bufnr]
  (do
    (nvim.buf_set_keymap bufnr :n :gd "<Cmd>lua vim.lsp.buf.definition()<CR>" {:noremap true})
    (nvim.buf_set_keymap bufnr :n :K "<Cmd>lua vim.lsp.buf.hover()<CR>" {:noremap true})
    (nvim.buf_set_keymap bufnr :n :<leader>ld "<Cmd>lua vim.lsp.buf.declaration()<CR>" {:noremap true})
    (nvim.buf_set_keymap bufnr :n :<leader>lt "<cmd>lua vim.lsp.buf.type_definition()<CR>" {:noremap true})
    (nvim.buf_set_keymap bufnr :n :<leader>lh "<cmd>lua vim.lsp.buf.signature_help()<CR>" {:noremap true})
    (nvim.buf_set_keymap bufnr :n :<leader>ln "<cmd>lua vim.lsp.buf.rename()<CR>" {:noremap true})
    (nvim.buf_set_keymap bufnr :n :<leader>le "<cmd>lua vim.diagnostic.open_float()<CR>" {:noremap true})
    (nvim.buf_set_keymap bufnr :n :<leader>lq "<cmd>lua vim.diagnostic.setloclist()<CR>" {:noremap true})
    (nvim.buf_set_keymap bufnr :n :<leader>lf "<cmd>lua vim.lsp.buf.format()<CR>" {:noremap true})
    (nvim.buf_set_keymap bufnr :n :<leader>lj "<cmd>lua vim.diagnostic.goto_next()<CR>" {:noremap true})
    (nvim.buf_set_keymap bufnr :n :<leader>lk "<cmd>lua vim.diagnostic.goto_prev()<CR>" {:noremap true})
    (nvim.buf_set_keymap bufnr :n :<leader>la "<cmd>lua vim.lsp.buf.code_action()<CR>" {:noremap true})
    (nvim.buf_set_keymap bufnr :v :<leader>la "<cmd>lua vim.lsp.buf.range_code_action()<CR> " {:noremap true})
    ;telescope
    (nvim.buf_set_keymap bufnr :n :<leader>lw ":lua require('telescope.builtin').lsp_workspace_diagnostics()<cr>" {:noremap true})
    (nvim.buf_set_keymap bufnr :n :<leader>lr ":lua require('telescope.builtin').lsp_references()<cr>" {:noremap true})
    (nvim.buf_set_keymap bufnr :n :<leader>li ":lua require('telescope.builtin').lsp_implementations()<cr>" {:noremap true})))

(defn- capabilities
 []
 (let [(ok? cmplsp) (pcall #(require :cmp_nvim_lsp))]
   (when ok?
     (cmplsp.default_capabilities))))

(defn- setup-lsp-diagnostics-colors
  []
  (let [(ok? trouble) (pcall #(require :trouble))]
    (when ok?
      (trouble.setup {})))
  (let [(ok? lspcolors) (pcall #(require :lsp-colors))]
    (when ok?
      (lspcolors.setup
        {:Error "#db4b4b"
         :Warning "#e0af68"
         :Information "#0db9d7"
         :Hint "#10B981"}))))

(defn setup
  []
  (let [(lsp-ok? lsp) (pcall #(require :lspconfig))]
    (when lsp-ok?
      (if (= (nvim.fn.has "nvim-0.6") 1)
        (define-signs "Diagnostic")
        (define-signs "LspDiagnostics"))
      (setup-lsp-diagnostics-colors)
      (let [handlers {"textDocument/publishDiagnostics" (lsp-diagnostic)
                      "textDocument/hover" (lsp-hover)
                      "textDocument/signatureHelp" (signature-help)}]
        (lsp.clojure_lsp.setup
          {:on_attach on_attach
           :capabilities (capabilities)
           :handlers handlers})))))

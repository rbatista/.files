(module modules.telescope
  {autoload {nvim aniseed.nvim}})

(defn plugins
  [use]
  (use :nvim-telescope/telescope.nvim {:requires [:nvim-lua/popup.nvim
                                                  :nvim-lua/plenary.nvim]}))



(nvim.set_keymap :n :<leader>ff ":lua require('telescope.builtin').find_files()<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>fg ":lua require('telescope.builtin').live_grep()<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>fb ":lua require('telescope.builtin').buffers()<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>fh ":lua require('telescope.builtin').help_tags()<CR>" {:noremap true})

(def- find-command
  ["rg" "--files" "--iglob" "!.git" "--hidden"])

(defn setup
  []
  (let [(ok? telescope) (pcall #(require :telescope))]
    (when ok?
      (telescope.setup
        {:defaults
         {:file_ignore_patterns ["node_modules" "target" "*.class"]}
          :pickers {:find_files {:find_command find-command}}}))))

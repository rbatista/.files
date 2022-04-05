(module theme
  {autoload {nvim aniseed.nvim}})

(let [(ok? material) (pcall #(require :material))]
  (when ok?
    (material.setup
      {:custom_highlights {:FloatBorder "#1A1A1A"}
       :borders true
       :high_visibility {:darker true}
       :italics {:comments true}})

    (set nvim.g.material_style :palenight)
    (nvim.ex.colorscheme :material)))

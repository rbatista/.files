-- Ensure pluggin manager and anised are installed
-- This allow load fenel code and install more plugins

local execute = vim.api.nvim_command
local fn = vim.fn
local fmt = string.format

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Work out where our plugins will be stored.
-- local pack_path = fn.stdpath("data") .. "/site/pack"

-- Ensures a given github.com/USER/REPO is cloned in the pack/packer/start directory.
-- function ensure(user, repo)
--  local install_path = fmt("%s/packer/start/%s", pack_path, repo, repo)
--  if fn.empty(fn.glob(install_path)) > 0 then
--    execute(fmt("!git clone https://github.com/%s/%s %s", user, repo, install_path))
--    execute(fmt("packadd %s", repo))
--  end
-- end


-- Packer is the plugin manager.
--ensure("wbthomason", "packer.nvim")

-- Aniseed compiles our Fennel code to Lua and loads it automatically.
--ensure("Olical", "aniseed")

-- Enable Aniseed's automatic compilation and loading of Fennel source code.
-- Aniseed looks for this when it's loaded then loads the rest of your
-- configuration if it's set.
vim.g["aniseed#env"] = {module = "init"}

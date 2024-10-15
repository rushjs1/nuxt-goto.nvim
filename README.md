# Nuxt-goto.nvim

Similar to [this vscode plugin](https://github.com/antfu/vscode-goto-alias) but for neovim.

## Purpose

Using lsp `Go to Definition` on a vue component in nuxt will take you to a `.d.ts` file. This plugin will redirect you to the correct definition source instead.

Please see Anthonys readme [here](https://github.com/antfu/vscode-goto-alias?tab=readme-ov-file#motivation) for a better explanation on why this is necessary.

## Installation

```lua
--Packer
use("rushjs1/nuxt-goto.nvim")
```

## Usage

```lua
-- lspconfig.lua -- or wherever your lsp keymaps are set

-- enable keybinds for available lsp server
local on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }

    --set keybind for go to definition
    keymap.set("n", "gd", vim.lsp.buf.definition, opts)
end
```

Please ensure the .nuxt directory is present in your project

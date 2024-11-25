# Nuxt-goto.nvim

Similar to [this vscode plugin](https://github.com/antfu/vscode-goto-alias) but for neovim.

## Purpose

Using lsp `Go to Definition` on a vue component in nuxt will take you to a `.d.ts` file. This plugin will redirect you to the correct definition source instead.

Please see Anthonys readme [here](https://github.com/antfu/vscode-goto-alias?tab=readme-ov-file#motivation) for a better explanation on why this is necessary.

## Installation

Using [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
-- plugins/nuxt-goto.lua
return {
  "rushjs1/nuxt-goto.nvim",
  ft = "vue",
}

-- init.lua
    {
      "rushjs1/nuxt-goto.nvim",
      ft = "vue",
    }
```

Using [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
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

## Important Notes

Please ensure the .nuxt directory is present in your project

Please note this plugin sets a wrapper around the neovim native LSP function `vim.lsp.buf.definition`, so if you are calling 'go to definition' another way it will not work.
Please feel free to let me know of your use cases in an [issue](https://github.com/rushjs1/nuxt-goto.nvim/issues) :)

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
**lazy.nvim**
```lua
return {
  "rushjs1/nuxt-goto.nvim",
  ft = { "vue" }
}:
```

# Usage

If you are using WhichKey "folke/which-key.nvim", you can add below to your keymaps as using telescope builtin goto will not work.
```lua
  n = {
    name = "Nuxt",
    d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Nuxt Definition"},
    r = { "<cmd>lua vim.lsp.buf.references()<CR>", "Nuxt References"},
    k = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Nuxt Definition"},
  },
```
You also need to reopen your project and `npm run dev` after adding an auto-imported components

# veridian 

Install veridian

```bash
cargo install --git https://github.com/vivekmalneedi/veridian.git
echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```
# Neovim LSP Configuration

This document explains the keybinds set up for the Neovim LSP configuration. In this setup, the leader key is set to `<Space>`. The following keybinds have been configured to make interacting with diagnostics and language servers more efficient.

## General Keybinds

| Keybind      | Function                                       | Description                                                                 |
|--------------|------------------------------------------------|-----------------------------------------------------------------------------|
| `<leader>o`  | `vim.diagnostic.open_float`                    | Opens a floating window with the current diagnostic at the cursor position. |
| `[d`         | `vim.diagnostic.goto_prev`                     | Jumps to the previous diagnostic in the buffer.                             |
| `]d`         | `vim.diagnostic.goto_next`                     | Jumps to the next diagnostic in the buffer.                                 |
| `<leader>q`  | `vim.diagnostic.setloclist`                    | Adds all current diagnostics to the location list.                          |
| `<leader>td` | Toggle Diagnostics                             | Toggles diagnostics on and off globally.                                    |

## Keybinds for LSP Functions

These keybinds are triggered after the language server attaches to the current buffer.

| Keybind              | Function                              | Description                                                               |
|----------------------|---------------------------------------|---------------------------------------------------------------------------|
| `gD`                 | `vim.lsp.buf.declaration`             | Go to the declaration of the symbol under the cursor.                     |
| `gd`                 | `vim.lsp.buf.definition`              | Go to the definition of the symbol under the cursor.                      |
| `K`                  | `vim.lsp.buf.hover`                   | Show the hover information for the symbol under the cursor.               |
| `gi`                 | `vim.lsp.buf.implementation`          | Go to the implementation of the symbol under the cursor.                  |
| `<C-k>`              | `vim.lsp.buf.signature_help`          | Show signature help (function arguments) for the symbol under the cursor. |
| `<leader>wa`         | `vim.lsp.buf.add_workspace_folder`     | Add a folder to the workspace.                                            |
| `<leader>wr`         | `vim.lsp.buf.remove_workspace_folder`  | Remove a folder from the workspace.                                       |
| `<leader>wl`         | List Workspace Folders                | Print a list of all workspace folders.                                    |
| `<leader>D`          | `vim.lsp.buf.type_definition`         | Go to the type definition of the symbol under the cursor.                 |
| `<leader>rn`         | `vim.lsp.buf.rename`                  | Rename the symbol under the cursor.                                       |
| `<leader>ca`         | `vim.lsp.buf.code_action`             | Show code actions available at the current cursor position.               |
| `gr`                 | `vim.lsp.buf.references`              | Show references to the symbol under the cursor.                           |
| `<leader>f`          | `vim.lsp.buf.formatting`              | Format the current buffer.                                                |

## Language-Specific Configuration

- **Lua Language Server (`lua_ls`)**: Standard setup with the above keybinds.
- **Verible (for Verilog and SystemVerilog)**: Supports `verilog` and `systemverilog` file types with the above keybinds.
- **Clangd (for C, C++, Objective-C)**: 
  - Uses clangd with specific options such as `--clang-tidy` and `--background-index`.
  - Supports `c`, `cpp`, `cc`, `mpp`, and `ixx` file types.
  - Ensures detailed completion, function argument placeholders, and header insertion.



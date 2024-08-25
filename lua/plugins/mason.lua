return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",

        -- "json-lsp jsonls"
        -- ◍ lua-language-server lua_ls
        -- ◍ pylint
        -- ◍ pyright
        -- ◍ python-lsp-server pylsp
        -- ◍ rust-analyzer rust_analyzer
        -- ◍ typescript-language-server tsserver
        -- ◍ vtsls
      },
    },
  },
}

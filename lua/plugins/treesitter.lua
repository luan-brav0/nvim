return {
  -- for typescript, LazyVim also includes extra specs to properly setup lspconfig,
  { import = "lazyvim.plugins.extras.lang.typescript" },
  -- add more treesitter parsers

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
        "rust",
        "go",
        "zig",
      },
    },
  },
}

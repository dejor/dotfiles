local null_ls = require("null-ls")
null_ls.setup({
    sources = {
        null_ls.builtins.formatting.beautysh,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.cbfmt,
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.formatting.gofumpt,
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.formatting.goimports_reviser,
        null_ls.builtins.formatting.golines,
        null_ls.builtins.formatting.jq,
        null_ls.builtins.formatting.lua_format,
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.formatting.rustfmt,
        null_ls.builtins.formatting.shellharden,
        null_ls.builtins.formatting.stylelint,
        null_ls.builtins.formatting.taplo,
        null_ls.builtins.formatting.yamlfmt
    }
})

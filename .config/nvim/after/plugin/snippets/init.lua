local luasnip = require("luasnip")
-- Load snippets
require("luasnip/loaders/from_vscode").lazy_load()
require("luasnip.loaders.from_snipmate").lazy_load()

luasnip.filetype_extend("all", { "_" })

luasnip.filetype_extend("javascript", { "javascript" })

require('options')
require('keymaps')
require('plugins') -- Load plugins first so the colorscheme is available
require('theme').setup() -- Now call theme setup with colorscheme and brightness adjustments
require('lsp')

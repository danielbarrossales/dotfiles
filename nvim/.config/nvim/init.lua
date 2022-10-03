opt = vim.opt
opt.syntax = "on" 
opt.showmatch = true
opt.ruler = true
opt.smarttab = true
opt.shiftwidth = 4

vim.cmd[[
    au FileType plantuml let g:plantuml_previewer#plantuml_jar_path = "/usr/share/java/plantuml/plantuml.jar"
]]

return require('packer').startup(function(use)
    -- So that packer can manager itself
    use 'wbthomason/packer.nvim'
    -- Coding time tracking
    use 'wakatime/vim-wakatime'

    use 'neovim/nvim-lspconfig'

    use 'aklt/plantuml-syntax'

    use 'weirongxu/plantuml-previewer.vim'

    use 'tyru/open-browser.vim'
end)

vim.g.vimtex_compiler_latexmk = {
    executable = 'latexmk',
    options = {
        '-verbose',
        '-file-line-error',
        '-synctex=1',
        '-interaction=nonstopmode',
        '-shell-escape',
    },
}
vim.g.tex_conceal = ''

vim.g.tex_flavor = 'latex'

--vim.g.vimtex_compiler_latexmk_engines = { '_' : '-pdfdvi' }

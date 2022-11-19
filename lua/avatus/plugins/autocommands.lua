vim.g["symbols_outline_state"] = require("symbols-outline").state
vim.cmd([[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR> 
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200}) 
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
    autocmd FileType qf nnoremap <buffer> <CR> <CR>:cclose<CR>
    autocmd BufEnter * if winnr('$') == 1 && exists('g:symbols_outline_state.outline_buf') && g:symbols_outline_state.outline_buf | quit | endif
    autocmd FileType Outline setlocal signcolumn=no
  augroup end
  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end
  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
  augroup end
  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd = 
  augroup end
  augroup _alpha
    autocmd!
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=0
    autocmd User AlphaReady set cmdheight=0 | autocmd BufUnload <buffer> set cmdheight=0
  augroup end
]])

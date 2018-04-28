syn on
set list listchars=tab:>-,trail:·,eol:¶
set nu
set bg=dark
set hls
set incsearch
set ts=4
set sw=4
set nowrap

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.*/

call plug#begin('~/.vim/plugged')
Plug 'git-time-metric/gtm-vim-plugin'
Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'
call plug#end()

let g:gtm_plugin_status_enabled = 1
function! AirlineInit()
  if exists('*GTMStatusline')
    call airline#parts#define_function('gtmstatus', 'GTMStatusline')
    let g:airline_section_b = airline#section#create([g:airline_section_b, ' ', '[', 'gtmstatus', ']'])
  endif
endfunction
autocmd User AirlineAfterInit call AirlineInit()

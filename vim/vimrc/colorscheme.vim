"set background=light
"set background=dark
highlight Normal ctermfg=gray ctermbg=black

syntax on
syntax enable

"let base16colorspace=256

"colorscheme elliotlarson
"colorscheme base16-londontube
"colorscheme base16-tomorrow
colorscheme gruvbox

let g:gruvbox_contrast_dark = "hard"

" Show syntax highlighting groups for word under cursor
nmap <leader><leader>c :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc


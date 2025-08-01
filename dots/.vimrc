"set runtimepath+=~/.vim_runtime

"source ~/.vim_runtime/vimrcs/plugins_config.vim
"try
	"source ~/.vim_runtime/my_configs.vim
"catch
"endtry

"NOTES
"Equal comparing
" ==# is case sensitive
" ==? is case insensitive
" NEVER USE ==

"Visibility
syntax on
let &number = 0
let &relativenumber = 0
let &wrap = 1

"Indentation
"set expandtab
let &tabstop=4
let &shiftwidth=4
let &autoindent = 1
let &smartindent = 1

autocmd Filetype html set tabstop=2 shiftwidth=2
autocmd Filetype css set tabstop=2 shiftwidth=2
autocmd Filetype v set tabstop=2 shiftwidth=2
autocmd Filetype verilog set tabstop=2 shiftwidth=2
autocmd Filetype nix set tabstop=2 shiftwidth=2


set mouse=a
set showcmd


"KEYMAPS
nnoremap <space> <nop>
"let mapleader = "-"

"saving and or quitting
nnoremap <C-p> :wq<CR>
nnoremap <C-q> :w <CR>
nnoremap <C-n> :q!<CR>

"Moving text
nnoremap <M-Up> ddkP
nnoremap <M-Down> ddp

"Commenting
"work in proggress
"autocmd Filetype c nnoremap <buffer> <C-;> I//<esc>

"NerdTree
"nnoremap <C-e> :NERDTreeToggle<CR>

"Open terminal
nnoremap <C-y> :terminal<CR> 
nnoremap <C-t> :vs t<CR>:terminal<CR><C-w><C-w>:q!<CR>

"Auto indent text
nnoremap <C-o> :normal gg=G<CR>

"Shift-tab:
"For command/normal mode
nnoremap <S-Tab> <<
"For insert mode
inoremap <S-Tab> <C-d>

"Other
inoremap jk <esc>
nnoremap vs :vs<space>
nnoremap <CR> <nop>
nnoremap <Space> @
nnoremap H ^
nnoremap L $


iabbrev retrun return
iabbrev rtrun return

"boilerplates
autocmd Filetype c iabbrev <buffer> boiler int main(){<CR><CR>getchar();<CR>return 0;<CR>}<Up><Up><Up><tab>
autocmd Filetype c iabbrev <buffer> inclibs #include <stdio.h><CR>#include <stdbool.h><CR>#include <stdlib.h><CR>#include<string.h><CR>
autocmd Filetype cpp iabbrev <buffer> boiler int main(){<CR><CR>getchar();<CR>return 0;<CR>}<Up><Up><Up><tab>
autocmd Filetype java iabbrev <buffer> boiler public static void main(String[] args){<CR><CR>}<Up><tab><tab>


"Autocomplete
autocmd Filetype java iabbrev <buffer> SYOL System.out.println
autocmd Filetype java iabbrev <buffer> SYOP System.out.print

"Status Line
set laststatus=2
set statusline=\ %f\ -\ %y\ %m
set statusline+=%=
set statusline+=%6l/%-4L\ \ %P\ \ 


"Functions

"Copy and pasting text
nnoremap <C-c> :call Copymode()<CR>
let t:copying = 0
function Copymode()
	if(t:copying==#0)
		set mouse=
		set nonumber
		set norelativenumber
		echom "Entering copy mode"
	else
		set mouse=a 
		set number
		set relativenumber
		echom "Exiting copy mode"
	endif
	let t:copying = t:copying==#0 ? 1 : 0
endfunction


"Enable hex editing mode
nnoremap <C-x> :call Thex()<CR>
let t:hex = 0
fu Thex()
	if (t:hex==#0)
		exec "%!xxd"
	else
		exec "%!xxd -r"
	endif

	if (t:hex==#0)
		let t:hex = 1
	else
		let t:hex = 0
	endif
endfu

"__________________

function Renato(word)
	echom "ahhhh meniiiino" a:word
endfunction

function Many(...)
	echom a:0
	echom a:1
	echom a:000
endfunction

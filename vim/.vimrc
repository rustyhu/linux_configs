""""""""""CUSTOMIZATION""""""""""

"" Basics
"" As rm command is very dangerous in Unix-like systems, keeping a backup for files is necessary.""
"set nobackup
set number
set showcmd
syntax on
"" Indent
set sw=4
set ts=4
"" GUI
if has('gui_running')
	set lines=40 columns=85
	set guioptions-=T
	colorscheme desert 
	"" Interior character encoding 
	set fileencodings=utf-8,gbk,gb2312,big5,latin1
	"" ucs-bom,utf-8,cp950,big5,cp936,gb18030
endif

"" Programing Language
filetype indent on
"" For python
autocmd FileType python setlocal et sta sw=4 sts=4

""""""""""END CUSTOMIZATION""""""""""

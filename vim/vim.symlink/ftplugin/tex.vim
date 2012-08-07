set sw=2
set iskeyword+=:

" Autocompile
au BufWritePost *.tex silent call Tex_CompileLatex()
au BufWritePost *.tex silent !pkill -USR1 xdvi.bin

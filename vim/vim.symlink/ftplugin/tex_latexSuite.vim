" LaTeX filetype
"	  Language: LaTeX (ft=tex)
"	Maintainer: Srinath Avadhanula
"		 Email: srinath@fastmail.fm

if exists('did_latexSuite_disabled')
  finish
endif

if !exists('s:initLatexSuite')
	let s:initLatexSuite = 1
	exec 'so '.fnameescape(expand('<sfile>:p:h').'/latex-suite/main.vim')

	silent! do LatexSuite User LatexSuiteInitPost
endif

silent! do LatexSuite User LatexSuiteFileType


TexLet g:Tex_Env_align = "\\\begin{align*}\<++>\\\end{align*}"
TexLet g:Tex_CompileRule_dvi = 'latex -interaction=nonstopmode -src-specials $*'set cinwords=''

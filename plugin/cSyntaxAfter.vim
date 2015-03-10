" File: cSyntaxAfter.vim
" Author: Sergey Vlasov <sergey@vlasov.me>
" Last Change: 2015-03-10
" Version: 0.3
""
" This plugin was initially created for codeblock_dark color theme to
" highlight operators (+ - / * = <> () and others) in C-like languages.
" Why it's needed? Well, by default vim doesn't do that. After switching
" from Code::Block to vim I got really missed it.
"
" Then the plugin grew into something bigger. I started to use it to unify
" overal syntax highlighting for C-like languages.
"
" There are two ways to enable the plugin:
"
"   1. If you want to use CSyntaxAfter highlighting as is, put this into your
"   .vimrc:
"
"      autocmd! FileType c,cpp,java,php call CSyntaxAfter()
"
"   2. If you also want to extend the highlighting or add other C-like languages
"   support (Java, Go etc), create a corresponding <filetype>.vim file in
"   .vim/after/syntax/ and call CSyntaxAfter() from there instead.
"
"   WARNING: For same file type use either option (1.) or (2.), basically avoid calling
"   CSyntaxAfter() more than once.
"
"   For example, to distinguish "++" and "--" operator from "+" and "-" in C and C++,
"   remove "c" and "cpp" from autocmd above and instead create .vim/after/syntax/c.vim
"   with (cpp syntax is based on c):
"
"      if exists("*CSyntaxAfter")
"         call CSyntaxAfter()
"      endif
"
"      syntax match longOperators "++\|--"
"      hi longOperators guifg=green guibg=red
"

function! CSyntaxAfter()
	syntax keyword Boolean true false NULL TRUE FALSE
	syntax keyword Statement namespace stderr stdin stdout new this delete

	syntax match _Block "[{}]"
	syntax match _Bracket "[\[\]]"
	syntax match _Operator "[-+&|<>=!\/~.,;:*%&^?()]"
	syntax region _Comment start="\/\*" end="\*\/"
	syntax match _Comment "\/\/.*$"

	hi _Block guifg=yellow1 guibg=NONE gui=none
	hi link _Bracket Constant
	hi link _Operator Operator
	hi link _Comment Comment
endfunction


" File: cSyntaxAfter.vim
" Author: Sergey Vlasov <sergey.vlsv@gmail.com>
" Last Change:  2010-10-05
" Version:      0.1
" Created for codeblock_dark color theme to highlight c operators.
" It's possible to apply to other languages with c-like syntax (Java, Go etc).
" Just add into your e.g. ~/.vim/after/syntax/java.vim:
"
"    if exists("*CSyntaxAfter")
"       call CSyntaxAfter()
"    endif

function! CSyntaxAfter()
	syntax keyword Boolean true false NULL TRUE FALSE
	syntax keyword Normal sizeof
	syntax keyword Statement stderr stdin stdout

	syntax match	myBracket "[\[\]]"
	syntax match	myBlock "[{}]"
	hi link			myBracket Constant
	hi myBlock		guifg=yellow1	guibg=NONE	gui=none

	syntax match	myOperator display "[-+&|<>=!\/~.,;:*%&^?()@]"
	syntax region	myComment start="\/\*" end="\*\/"
	syntax match	myComment "\/\/.*$"

	hi link myOperator Operator
	hi link myComment Comment
endfunction


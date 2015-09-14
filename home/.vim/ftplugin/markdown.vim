
map <F9> :call GenerateHtml()<CR><CR><CR>
" map <F9> :!markdown % -o %.html<CR><CR>
" map <F10> :!echo "<link rel='stylesheet' href='///u/awong16/custom/markdown-css-themes/markdown.css' />" >> %.html<CR><CR>


" au BufWritePost *.md call GenerateHtml()
" au BufWritePost *.markdown call GenerateHtml()

" function GenerateHtml()
" 	!markdown % -o %.html
" 	!echo "<link rel='stylesheet' href='///u/awong16/custom/markdown-css-themes/markdown.css' />" >> %.html
" endfunction

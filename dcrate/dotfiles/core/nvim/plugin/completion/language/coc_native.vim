"
" Plugin Config 
" Completion -  Language Support
" Coc Native Extensions Languages 
" NeoVim Configuration
" 

"Language Support for Coc Native Extension Languages
function! BuildJsonLangServer()
    CocInstall -sync 'coc-json'
endfunction
function! BuildYamlLangServer()
    CocInstall -sync 'coc-yaml' 
endfunction
function! BuildJsTsLangServer()
    CocInstall -sync 'coc-tsserver' 
endfunction
function! BuildCssLangServer()
    CocInstall -sync 'coc-css' 
endfunction
function! BuildHtmlLangServer()
    CocInstall -sync 'coc-html' 
endfunction
function! BuildPythonLangServer()
    CocInstall -sync 'coc-python' 
endfunction
function! BuildJavaLangServer()
    CocInstall -sync 'coc-java' 
endfunction
function! BuildDockerLangServer()
    CocInstall -sync 'coc-docker' 
endfunction


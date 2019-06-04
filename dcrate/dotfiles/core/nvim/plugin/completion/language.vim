"
" Plugin Config 
" Completion -  Language Support
" NeoVim Configuration
" 

"Language Support
" language-specific support
source ~/.config/nvim/plugin/completion/language/scala.vim
source ~/.config/nvim/plugin/completion/language/c_cpp_objc.vim
source ~/.config/nvim/plugin/completion/language/coc_native.vim

" language support setup configuration { language name : setup function }
let g:lang_support_config = { 
    \"scala": function("BuildScalaLangServer"),
    \ "c,cpp,objc": function('BuildClangLangServer'),
    \ "json": function('BuildJsonLangServer'),
    \ "yaml": function('BuildYamlLangServer'),
    \ "js,ts": function('BuildJsTsLangServer'), 
    \ "css": function('BuildCssLangServer'),
    \ "html": function('BuildHtmlLangServer'),
    \ "python": function('BuildPythonLangServer'),
    \ "java": function('BuildJavaLangServer'),
    \ "dockerfile": function('BuildDockerLangServer')
\}

" DeployLangSupport() - deploy language support according to the given
" configuration
function! DeployLangSupport(config)
    let l:languages = keys(a:config)
    echo 'deploying language support for ' . join(l:languages, ",")
    for l:language in l:languages
        echo 'currently deploying language support for ' . l:language
        " call setup support function for language
        let l:SetupLanguage = a:config[l:language]
        silent call l:SetupLanguage()
    endfor
    
    " Clean up screen
    redraw!    
endfunction

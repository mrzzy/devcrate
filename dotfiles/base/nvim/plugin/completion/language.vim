"
" Plugin Config
" Completion -  Language Support
" NeoVim Configuration
"

"Language Support
" language-specific support
source ~/.config/nvim/plugin/completion/language/c_cpp_objc.vim
source ~/.config/nvim/plugin/completion/language/coc_native.vim

" additional language support setup configuration { language name : setup function }
let g:lang_support_config = {}
if ! $IS_DEVCRATE || $CPP_ENABLE == '1'
    let g:lang_support_config['c_cpp_objc'] = function('BuildClangLangServer')
endif

" DeployLangSupport() - deploy language support not covered by coc extensions
function! DeployLangSupport(config)
    let l:languages = keys(a:config)
    for l:language in l:languages
        " call setup language support
        echo 'deploying language support for ' . l:language
        let l:SetupLanguage = a:config[l:language]
        silent call l:SetupLanguage()
    endfor
    " Clean up screen
    redraw!
endfunction

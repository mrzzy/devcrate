"
" Plugin Config
" Completion -  Language Support
" Coc Native Extensions Languages
" NeoVim Configuration
"

function! InstallCOCExtensions()
    " core completion sources
    CocInstall -sync coc-tag coc-syntax coc-ultisnips coc-yaml coc-json coc-html

    " deploy only if explicit specified in <LANG>_ENABLE env var
    "js/ts
    if ! $IS_DEVCRATE || $JS_ENABLE == '1'
        CocInstall -sync coc-tsserver
    endif

    "java
    if ! $IS_DEVCRATE || $JAVA_ENABLE == '1'
        CocInstall -sync coc-java
    endif

    "python
    if ! $IS_DEVCRATE || $PYTHON_ENABLE == '1'
        CocInstall -sync coc-pyright
    endif

    "csharp
    if ! $IS_DEVCRATE || $CSHARP_ENABLE == '1'
        CocInstall -sync coc-omnisharp
    endif

    "scala
    if ! $IS_DEVCRATE || $SCALA_ENABLE == '1'
        CocInstall -sync coc-metals
    endif

    "golang
    if ! $IS_DEVCRATE || $GO_ENABLE == '1'
        CocInstall -sync coc-go
    endif

    "rust
    if ! $IS_DEVCRATE || $GO_ENABLE == '1'
        CocInstall -sync coc-rls
    endif
endfunction

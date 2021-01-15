"
" Plugin Config
" Completion -  Language Support
" Coc Native Extensions Languages
" NeoVim Configuration
"

" devcrate - deploy only if explicit specified in <LANG>_ENABLE env var
"js/ts
if ! $IS_DEVCRATE || $JS_ENABLE == '1'
    Plug 'neoclide/coc-tsserver', {'tag': '1.3.7', 'do': 'yarn install --frozen-lockfile'}
endif

"java
if ! $IS_DEVCRATE || $JAVA_ENABLE == '1'
    Plug 'neoclide/coc-java', {'do': 'yarn install --frozen-lockfile'}
endif

"python
if ! $IS_DEVCRATE || $PYTHON_ENABLE == '1'
    Plug 'neoclide/coc-python', {'do': 'yarn install --frozen-lockfile'}
endif

"csharp
if ! $IS_DEVCRATE || $CSHARP_ENABLE == '1'
    Plug 'coc-extensions/coc-omnisharp', {'do': 'yarn install --frozen-lockfile'}
endif

"scala
if ! $IS_DEVCRATE || $SCALA_ENABLE == '1'
    Plug 'scalameta/coc-metals', {'do': 'yarn install --frozen-lockfile'}
endif

"golang
if ! $IS_DEVCRATE || $GO_ENABLE == '1'
    Plug 'josa42/coc-go', {'do': 'yarn install --frozen-locklife'}
endif


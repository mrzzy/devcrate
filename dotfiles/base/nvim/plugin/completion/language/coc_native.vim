"
" Plugin Config 
" Completion -  Language Support
" Coc Native Extensions Languages 
" NeoVim Configuration
" 

"Language Support for Coc Native Extension Languages
"js/ts
if ! $IS_DEVCRATE || $NVIM_JS_ENABLE == '1'
    Plug 'neoclide/coc-tsserver', {'tag': '1.3.7', 'do': 'yarn install --frozen-lockfile'} 
endif

"yaml
if ! $IS_DEVCRATE || $NVIM_YAML_ENABLE == '1'
    Plug 'neoclide/coc-yaml', {'do': 'yarn install --frozen-lockfile'} 
endif

"json
if ! $IS_DEVCRATE || $NVIM_JSON_ENABLE == '1'
    Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'} 
endif

"html
if ! $IS_DEVCRATE || $NVIM_HTML_ENABLE == '1'
    Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'} 
endif

"java
if ! $IS_DEVCRATE || $NVIM_JAVA_ENABLE == '1'
    Plug 'neoclide/coc-java', {'do': 'yarn install --frozen-lockfile'}
endif

"python
if ! $IS_DEVCRATE || $NVIM_PYTHON_ENABLE == '1'
    Plug 'neoclide/coc-python', {'do': 'yarn install --frozen-lockfile'}
endif

"csharp
if ! $IS_DEVCRATE || $NVIM_CSHARP_ENABLE == '1'
    Plug 'coc-extensions/coc-omnisharp', {'do': 'yarn install --frozen-lockfile'}
endif

"scala
if ! $IS_DEVCRATE || $NVIM_SCALA_ENABLE == '1'
    Plug 'ckipp01/coc-metals', {'do': 'yarn install --frozen-lockfile'}
endif

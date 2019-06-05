"
" Plugin Config 
" C# Completion
" NeoVim Configuration
" 
" C# completion configuration
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_highlight_types = 2
" note: absolute path required for omnisharp to work properly
let g:OmniSharp_server_path = '/home/zzy/.local/share/omnisharp/run'

" RetrievLatestTag() - retrieves from github repository given  as 'user/repo'
function! RetrieveLatestTag(repo) abort
    let l:latest_tag = systemlist(
        \'curl -s https://api.github.com/repos/' . a:repo . '/releases/latest ' .
        \ ' | grep "tag_name" | sed -e "s/^.*\(v[0-9\.]*\).*$/\1/g"')[0]
    return l:latest_tag
endfunction

" SetupCSharpLangServer() - pulls omnisharp language server
function! SetupCSharpLangServer(info) abort
    if a:info.status == 'installed' || a:info.force
        " setup work directory
        let l:work_dir = '/tmp/csharp_ls' 
        exec 'silent !mkdir -p ' . l:work_dir
        
        "" pull language server from the internet
        echo 'pulling omnisharp languageserver'
        let l:server_repo =  'OmniSharp/omnisharp-roslyn'
        let l:latest_tag = RetrieveLatestTag(l:server_repo)
        exec '!aria2c --allow-overwrite=true -s 10 -x 10 -k 1M -d ' . l:work_dir
                    \ 'https://github.com/' . l:server_repo .
                    \ '/releases/download/' . l:latest_tag .
                    \ '/omnisharp-linux-x64.zip'
        
        "" extract & language server 
        echo 'extracting langserver'
        exec '!unzip -of ' . l:work_dir . '/omnisharp-linux-x64.zip ' .
                    \ '-d ' . fnamemodify(g:OmniSharp_server_path, ':h')
        " make language server executable
        exec '!chmod u+x ' . g:OmniSharp_server_path

        " cleanup
        exec '!rm -rf ' . l:work_dir
    endif
endfunction

" C# completion engine
Plug 'OmniSharp/omnisharp-vim', {'do': function('SetupCSharpLangServer')}

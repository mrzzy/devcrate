"
" Plugin Config 
" Scala Completion
" NeoVim Configuration
" 

" BuildScalaLangServer() - buids scala language server
" prerequisites - Java 8, OpenJDK 8, Scala 2.12
function! BuildScalaLangServer() abort
    " setup work directory
    let l:work_dir = '/tmp/scala_ls' 
    exec 'silent !mkdir -p ' . l:work_dir
   
    " pull build tool from the internet
    echo 'setting up build tool (coursier)'
    exec '!curl -L -o ' . l:work_dir . '/coursier' 'https://git.io/coursier'
    exec '!chmod u+x '. l:work_dir . '/coursier'
   
    " build and write scala language server
    echo 'building language server'
    exec '!' . l:work_dir .  '/coursier' . ' bootstrap '
                \ . ' --java-opt -Xss4m'
                \ . ' --java-opt -Xms100m'
                \ . ' --java-opt -Dmetals.client=coc.nvim'
                \ . ' org.scalameta:metals_2.12:0.5.2'
                \ . ' -r bintray:scalacenter/releases'
                \ . ' -r sonatype:snapshots'
                \ . ' -o ~/.local/bin/metals-vim -f'
    " cleanup
    exec 'silent !rm -rf ' . l:work_dir
endfunction

"
" Plugin Config
" C/C++/Objective-C Completion
" NeoVim Configuration
"

" BuildClangLangServer() - builds c/c++/obj-c language sever
" prerequisites - cmake>=3.8, clang, clang-7 libclang-dev
function! BuildClangLangServer() abort
    if executable('/usr/local/bin/ccls')
        " ccls already installed nothing to do
        return
    endif
    " setup work directory
    let l:work_dir = '/tmp/clang_ls'
    exec 'silent !mkdir -p ' . l:work_dir

    " retrieve source code
    echo 'pulling source code'
    exec '!git clone --depth=1 --recursive https://github.com/MaskRay/ccls '
                \ . l:work_dir . '/ccls'

    " build language server
    echo 'building language server'
    exec '!cd ' . l:work_dir . '/ccls &&'
                \ . ' cmake -H. -BRelease -DCMAKE_BUILD_TYPE=Release'
                \ . ' -DCMAKE_PREFIX_PATH=/usr/lib/llvm-11'
                \ . ' -DLLVM_INCLUDE_DIR=/usr/lib/llvm-11/include'
                \ . ' -DLLVM_BUILD_INCLUDE_DIR=/usr/include/llvm-11'
                \ . ' -DCMAKE_INSTALL_PREFIX=~/.local/'

    " find no. of cores to enable multiple core build
    let l:num_cores = systemlist('nproc --all')[0]
    exec '!cd ' . l:work_dir . '/ccls &&'
                \ . ' cmake --build Release --target install'
                \ . ' -- -j ' . l:num_cores

    " cleanup
    exec 'silent !rm -rf ' . l:work_dir
endfunction

" vim: set expandtab ft=vim shiftwidth=2

if &cp || exists('g:loaded_chromebuf') | finish | endif
let g:loaded_chromebuf = 1

let s:save_cpo = &cpo
set cpo&vim

if !exists('g:chromebuf_default_mappings')
  let g:chromebuf_default_mappings = 1
endif

function! s:BufJump(index)
  let buflist = filter(range(1, bufnr('$')), 'buflisted(v:val)')
  let bufcount = len(buflist)
  let currbufnr = 1
  let selectedbufnr = 0

  if (bufcount > 0)
    if (a:index >= 9)
      let selectedbufnr = bufnr(buflist[bufcount - 1])
    else
      while currbufnr <= bufcount
        if (currbufnr == a:index)
          let selectedbufnr = bufnr(buflist[currbufnr - 1])
          break
        endif
        let currbufnr = currbufnr + 1
      endwhile
    endif
    execute ':b '. selectedbufnr
  endif
endfunction

com! -narg=1 BufJump :call s:BufJump(<f-args>)

if g:chromebuf_default_mappings
  if has('mac')
    nmap <d-1> :call <SID>BufJump(1)<cr>
    nmap <d-2> :call <SID>BufJump(2)<cr>
    nmap <d-3> :call <SID>BufJump(3)<cr>
    nmap <d-4> :call <SID>BufJump(4)<cr>
    nmap <d-5> :call <SID>BufJump(5)<cr>
    nmap <d-6> :call <SID>BufJump(6)<cr>
    nmap <d-7> :call <SID>BufJump(7)<cr>
    nmap <d-8> :call <SID>BufJump(8)<cr>
    nmap <d-9> :call <SID>BufJump(9)<cr>
  else
    nmap <c-1> :call <SID>BufJump(1)<cr>
    nmap <c-2> :call <SID>BufJump(2)<cr>
    nmap <c-3> :call <SID>BufJump(3)<cr>
    nmap <c-4> :call <SID>BufJump(4)<cr>
    nmap <c-5> :call <SID>BufJump(5)<cr>
    nmap <c-6> :call <SID>BufJump(6)<cr>
    nmap <c-7> :call <SID>BufJump(7)<cr>
    nmap <c-8> :call <SID>BufJump(8)<cr>
    nmap <c-9> :call <SID>BufJump(9)<cr>
endif

let &cpo = s:save_cpo
unlet s:save_cpo
finish

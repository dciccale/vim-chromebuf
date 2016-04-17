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
        let currbufnr += 1
      endwhile
    endif
    execute ':b '. selectedbufnr
  endif
endfunction

com! -narg=1 BufJump :call s:BufJump(<f-args>)

" map <c-#> or <d-#> from 1 to 9
if g:chromebuf_default_mappings
  let k = has('mac') ? 'd' : 'c'
  let n = 1
  while n <= 9
    exe 'nn <'.k.'-'.n.'> :call <sid>BufJump('.n.')<cr>'
    let n += 1
  endwhile
endif

let &cpo = s:save_cpo
unlet s:save_cpo
finish

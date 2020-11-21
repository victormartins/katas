let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/Projects/katas/docker_katas/03_rack_with_middleware/src
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1 Dockerfile
badd +10 Gemfile
badd +11 config.ru
badd +1 lib/main.rb
badd +39 lib/middleware/request_tracer.rb
badd +0 ~/Projects/katas/docker_katas/03_rack_with_middleware/README.md
badd +0 ~/Projects/katas/docker_katas/03_rack_with_middleware/docker-compose.yml
argglobal
%argdel
$argadd Dockerfile
edit Dockerfile
set splitbelow splitright
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
2wincmd h
wincmd _ | wincmd |
split
wincmd _ | wincmd |
split
wincmd _ | wincmd |
split
wincmd _ | wincmd |
split
4wincmd k
wincmd w
wincmd w
wincmd w
wincmd w
wincmd w
wincmd w
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe '1resize ' . ((&lines * 10 + 34) / 68)
exe 'vert 1resize ' . ((&columns * 78 + 126) / 253)
exe '2resize ' . ((&lines * 16 + 34) / 68)
exe 'vert 2resize ' . ((&columns * 78 + 126) / 253)
exe '3resize ' . ((&lines * 10 + 34) / 68)
exe 'vert 3resize ' . ((&columns * 78 + 126) / 253)
exe '4resize ' . ((&lines * 12 + 34) / 68)
exe 'vert 4resize ' . ((&columns * 78 + 126) / 253)
exe '5resize ' . ((&lines * 12 + 34) / 68)
exe 'vert 5resize ' . ((&columns * 78 + 126) / 253)
exe 'vert 6resize ' . ((&columns * 80 + 126) / 253)
exe 'vert 7resize ' . ((&columns * 93 + 126) / 253)
argglobal
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 2 - ((1 * winheight(0) + 5) / 10)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
2
normal! 0
wincmd w
argglobal
if bufexists("~/Projects/katas/docker_katas/03_rack_with_middleware/docker-compose.yml") | buffer ~/Projects/katas/docker_katas/03_rack_with_middleware/docker-compose.yml | else | edit ~/Projects/katas/docker_katas/03_rack_with_middleware/docker-compose.yml | endif
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 5 - ((4 * winheight(0) + 8) / 16)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
5
normal! 0
lcd ~/Projects/katas/docker_katas/03_rack_with_middleware/src
wincmd w
argglobal
if bufexists("~/Projects/katas/docker_katas/03_rack_with_middleware/src/Gemfile") | buffer ~/Projects/katas/docker_katas/03_rack_with_middleware/src/Gemfile | else | edit ~/Projects/katas/docker_katas/03_rack_with_middleware/src/Gemfile | endif
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 8 - ((4 * winheight(0) + 5) / 10)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
8
normal! 0
lcd ~/Projects/katas/docker_katas/03_rack_with_middleware/src
wincmd w
argglobal
if bufexists("~/Projects/katas/docker_katas/03_rack_with_middleware/src/config.ru") | buffer ~/Projects/katas/docker_katas/03_rack_with_middleware/src/config.ru | else | edit ~/Projects/katas/docker_katas/03_rack_with_middleware/src/config.ru | endif
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 11 - ((9 * winheight(0) + 6) / 12)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
11
normal! 019|
lcd ~/Projects/katas/docker_katas/03_rack_with_middleware/src
wincmd w
argglobal
if bufexists("~/Projects/katas/docker_katas/03_rack_with_middleware/README.md") | buffer ~/Projects/katas/docker_katas/03_rack_with_middleware/README.md | else | edit ~/Projects/katas/docker_katas/03_rack_with_middleware/README.md | endif
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 7 - ((3 * winheight(0) + 6) / 12)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
7
normal! 026|
lcd ~/Projects/katas/docker_katas/03_rack_with_middleware/src
wincmd w
argglobal
if bufexists("~/Projects/katas/docker_katas/03_rack_with_middleware/src/lib/main.rb") | buffer ~/Projects/katas/docker_katas/03_rack_with_middleware/src/lib/main.rb | else | edit ~/Projects/katas/docker_katas/03_rack_with_middleware/src/lib/main.rb | endif
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=5
setlocal fml=1
setlocal fdn=20
setlocal fen
6
normal! zo
12
normal! zo
17
normal! zo
18
normal! zo
23
normal! zo
let s:l = 28 - ((27 * winheight(0) + 32) / 64)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
28
normal! 0
lcd ~/Projects/katas/docker_katas/03_rack_with_middleware/src
wincmd w
argglobal
if bufexists("~/Projects/katas/docker_katas/03_rack_with_middleware/src/lib/middleware/request_tracer.rb") | buffer ~/Projects/katas/docker_katas/03_rack_with_middleware/src/lib/middleware/request_tracer.rb | else | edit ~/Projects/katas/docker_katas/03_rack_with_middleware/src/lib/middleware/request_tracer.rb | endif
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=3
setlocal fml=1
setlocal fdn=20
setlocal fen
5
normal! zo
7
normal! zo
37
normal! zo
43
normal! zo
46
normal! zo
43
normal! zo
46
normal! zo
let s:l = 39 - ((38 * winheight(0) + 32) / 64)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
39
normal! 072|
lcd ~/Projects/katas/docker_katas/03_rack_with_middleware/src
wincmd w
6wincmd w
exe '1resize ' . ((&lines * 10 + 34) / 68)
exe 'vert 1resize ' . ((&columns * 78 + 126) / 253)
exe '2resize ' . ((&lines * 16 + 34) / 68)
exe 'vert 2resize ' . ((&columns * 78 + 126) / 253)
exe '3resize ' . ((&lines * 10 + 34) / 68)
exe 'vert 3resize ' . ((&columns * 78 + 126) / 253)
exe '4resize ' . ((&lines * 12 + 34) / 68)
exe 'vert 4resize ' . ((&columns * 78 + 126) / 253)
exe '5resize ' . ((&lines * 12 + 34) / 68)
exe 'vert 5resize ' . ((&columns * 78 + 126) / 253)
exe 'vert 6resize ' . ((&columns * 80 + 126) / 253)
exe 'vert 7resize ' . ((&columns * 93 + 126) / 253)
tabnext 1
if exists('s:wipebuf') && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 winminheight=1 winminwidth=1 shortmess=filnxtToOFc
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :

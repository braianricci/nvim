let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/desktop/dev/balancer
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
set shortmess+=aoO
badd +13 ~/desktop/dev/balancer/electron/index.html
badd +24 ~/desktop/dev/balancer/electron/main.js
badd +103 term://~/desktop/dev/balancer//14232:C:/Windows/System32/WindowsPowerShell/v1.0/powershell.EXE
badd +128 ~/AppData/Local/nvim/init.lua
badd +1 ~/desktop/dev/balancer/server/index.js
badd +50 ~/AppData/Local/nvim/lua/fterminal.lua
badd +3 ~/AppData/Local/nvim/lua/tabline.lua
badd +6 term://~/desktop/dev/balancer//8972:C:/Windows/System32/WindowsPowerShell/v1.0/powershell.EXE
badd +26 term://~/desktop/dev/balancer//4904:C:/Windows/System32/WindowsPowerShell/v1.0/powershell.EXE
badd +23 term://~/desktop/dev/balancer//16044:C:/Windows/System32/WindowsPowerShell/v1.0/powershell.EXE
badd +41 term://~/desktop/dev/balancer//16328:C:/Windows/System32/WindowsPowerShell/v1.0/powershell.EXE
badd +128 term://~/desktop/dev/balancer//22204:C:/Windows/System32/WindowsPowerShell/v1.0/powershell.EXE
badd +4 ~/desktop/dev/balancer/electron/preload.js
badd +5 ~/desktop/dev/balancer/electron/renderer.js
badd +0 ~/desktop/dev/balancer/readme.md
badd +191 ~/AppData/Local/nvim-data/site/pack/core/opt/CopilotChat.nvim/lua/CopilotChat/config/functions.lua
badd +399 ~/AppData/Local/nvim-data/site/pack/core/opt/CopilotChat.nvim/lua/CopilotChat/config/mappings.lua
badd +8 ~/AppData/Local/nvim-data/site/pack/core/opt/CopilotChat.nvim/lua/CopilotChat/config/providers.lua
argglobal
%argdel
set stal=2
tabnew +setlocal\ bufhidden=wipe
tabnew +setlocal\ bufhidden=wipe
tabnew +setlocal\ bufhidden=wipe
tabrewind
edit ~/desktop/dev/balancer/server/index.js
argglobal
balt ~/desktop/dev/balancer/electron/main.js
setlocal foldmethod=manual
setlocal foldexpr=0
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldenable
silent! normal! zE
let &fdl = &fdl
let s:l = 1 - ((0 * winheight(0) + 23) / 46)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 025|
tabnext
edit ~/desktop/dev/balancer/electron/main.js
argglobal
balt ~/desktop/dev/balancer/electron/index.html
setlocal foldmethod=manual
setlocal foldexpr=0
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldenable
silent! normal! zE
let &fdl = &fdl
let s:l = 13 - ((12 * winheight(0) + 23) / 46)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 13
normal! 0
tabnext
edit ~/desktop/dev/balancer/electron/index.html
argglobal
balt ~/AppData/Local/nvim/init.lua
setlocal foldmethod=manual
setlocal foldexpr=0
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldenable
silent! normal! zE
let &fdl = &fdl
let s:l = 11 - ((10 * winheight(0) + 23) / 46)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 11
normal! 012|
tabnext
edit ~/desktop/dev/balancer/electron/renderer.js
argglobal
setlocal foldmethod=manual
setlocal foldexpr=0
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldenable
silent! normal! zE
let &fdl = &fdl
let s:l = 10 - ((9 * winheight(0) + 23) / 46)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 10
normal! 018|
tabnext 2
set stal=1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :

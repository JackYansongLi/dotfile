let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/.config/sketchybar
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +46 ~/.config/sketchybar/sketchybarrc
badd +4 ~/.config/sketchybar/items/cpu.sh
badd +5 ~/.config/sketchybar/plugins/cpu.sh
badd +1 ~/.config/sketchybar/plugins/space.sh
badd +1 ~/.config/sketchybar/plugins/calendar.sh
badd +6 ~/.config/sketchybar/items/battery.sh
badd +6 ~/.config/sketchybar/items/ram.sh
badd +4 ~/.config/sketchybar/plugins/ram.sh
badd +6 ~/.config/sketchybar/items/calendar.sh
argglobal
%argdel
$argadd .
edit ~/.config/sketchybar/items/calendar.sh
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
3wincmd h
wincmd w
wincmd w
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
wincmd =
argglobal
balt ~/.config/sketchybar/plugins/cpu.sh
let s:l = 6 - ((5 * winheight(0) + 21) / 42)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 6
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("~/.config/sketchybar/plugins/calendar.sh", ":p")) | buffer ~/.config/sketchybar/plugins/calendar.sh | else | edit ~/.config/sketchybar/plugins/calendar.sh | endif
if &buftype ==# 'terminal'
  silent file ~/.config/sketchybar/plugins/calendar.sh
endif
balt ~/.config/sketchybar/items/cpu.sh
let s:l = 1 - ((0 * winheight(0) + 21) / 42)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("~/.config/sketchybar/plugins/cpu.sh", ":p")) | buffer ~/.config/sketchybar/plugins/cpu.sh | else | edit ~/.config/sketchybar/plugins/cpu.sh | endif
if &buftype ==# 'terminal'
  silent file ~/.config/sketchybar/plugins/cpu.sh
endif
balt ~/.config/sketchybar/sketchybarrc
let s:l = 1 - ((0 * winheight(0) + 21) / 42)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("~/.config/sketchybar/items/ram.sh", ":p")) | buffer ~/.config/sketchybar/items/ram.sh | else | edit ~/.config/sketchybar/items/ram.sh | endif
if &buftype ==# 'terminal'
  silent file ~/.config/sketchybar/items/ram.sh
endif
balt ~/.config/sketchybar/plugins/cpu.sh
let s:l = 4 - ((3 * winheight(0) + 21) / 42)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 4
normal! 035|
wincmd w
wincmd =
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
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

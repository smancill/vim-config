# Vim features

## Vim 8.0

Features:

- Async I/O and channels
- Jobs
- Timers
- Lambdas
- Packages

Options:

- `belloff`
- `breakindent`
- `breakindentopt`
- `fixendofline`
- `packpath`
- `signcolumn`
- `tagcase`
- `termguicolors`

Insert mode commands:

- `CTRL-G U`

Visual mode commands:

- `CTRL-A`
- `CTRL-X`
- `g CTRL-A`
- `g CTRL-X`

Cmdline mode commands:

- `CTRL-G`
- `CTRL-T`

Commands:

- `:cbottom`
- `:cdo`
- `:cfdo`
- `:chistory`
- `:clearjumps`
- `:filter`
- `:helpclose`
- `:lbottom`
- `:ldo`
- `:lfdo`
- `:lhistory`
- `:packadd`
- `:packloadall`

Variables:

- `v:false`
- `v:none`
- `v:null`
- `v:true`

Autocommands:

- `CmdUndefined`
- `OptionSet`
- `TabClosed`
- `TabNew`
- `TexChanged`
- `TexChangedI`
- `WinNew`

Highlight groups:

- `EndOfBuffer`

Other:

- Distributed `defaults.vim`


## Vim 8.1

Features:

- Terminal windows
- Terminal debugger plugin

Options:

- `pumwidth`
- `pythonhome`
- `pythonhthreehome`
- `pyxversion`
- `termwinkey`
- `termwinscroll`
- `termwinsize`
- `viminfofile`

Commands:

- `:pythonx`
- `:pyx`
- `:pyxdo`
- `:pyxfile`
- `:terminal`
- `:tmap`
- `:tmapclear`
- `:tnoremap`
- `:tunmap`

Autocommands:

- `CmdlineChanged`
- `CmdlineEnter`
- `CmdlineLeave`
- `DirChanged`
- `TerminalOpen`
- `TextYankPost`

Other:

- Several improvements to quickfix list / window.


# Vim 8.2

Features:

- Popup windows
- Text properties

Options:

- `completepopup`
- `completeslash`
- `cursorlineopt`
- `modelineexpr`
- `previewpopup`
- `tagfunc`
- `termwintype`
- `vartabsoftstop`
- `vartabstop`
- `wincolor`

Commands:

- `:cabove`
- `:cafter`
- `:cbefore`
- `:cbelow`
- `:labove`
- `:lafter`
- `:lbefore`
- `:lbelow`
- `:tcd`
- `:tchdir`

Autocommands:

- `DiffUpdated`
- `TerminalWinOpen`

Other:

- Support modifyOtherKeys
- Use xdiff library
- `:unlet $ENV`
- `cfilter` plugin


## Vim 9.0

Features:

- Vim9 script
- Command line completion in popup menu
- Updated colorschemes

Normal mode commands:

- `g<TAB>`
- `zp`
- `zP`
- `zy`

Visual mode commands:

- `P`

Options:

- `autoshelldir`
- `spelloptions`
- `thesaurusfunc`
- `xtermcodes`

Commands:

- `:argdedupe`
- `:balt`

Variables:

- `v:collate`
- `v:colornames`
- `v:exiting`

Autocommands:

- `CompleteDonePre`
- `DirChangedPre`
- `InsertLeavePre`
- `ModeChanged`
- `SigUSR1`
- `WinClosed`
- `VimSuspend`
- `VimResume`

Other:

- Fuzzy matching for `wildoptions` and `:vimgrep`
- Open a terminal in a popup window
- `fillchars` option improvements
- Use `z=` when `spell` is off
- Support for activating CamelCase spell check with `spelloptions`
- Optional error code for `:cquit`
- Locale aware `:sort`
- Support `nostop` value in `backspace`
- `<Cmd>` special key (patch-8.2.1978)


## Vim 9.1

Features:

- Vim9 classes
- Virtual text
- Smooth scroll

Options:

- `jumpoptions`
- `keyprotocol`
- `showcmdloc`
- `smoothscroll`
- `splitkeep`

Commands:

- `:defer`
- `:echowindow`
- `:horizontal`

Autocommands:

- `TextChangedT`
- `WinResized`

Other:

- Support Python 3 stable ABI
- `ttyfast` always set


## Vim 9.2

Features:

- Builtin "comment" and "nohlsearch" plugins
- Wayland support
- XDG Desktop Specification support

Options:

- `completeitemalign`
- `findfunc`
- `winFixbuf`
- `tabclose`

Normal mode commands:

- `[r`
- `]r`

Commands:

- `:pbuffer`

Autocommands:

- `KeyInputPre`
- `SessionWritePost`
- `TermResponseAll`
- `WinNewpre`

Other:

- Support `z` flag in `cpoptions`
- Support `linematch` algorithm in `diffopt`

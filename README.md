# Configuration for Vim 8.x

This is a distribution of plugins and configurations to use Vim for development.
It uses [vim-plug][vim-plug] to have a well organized Vim directory and to
manage the plugins automatically.
The plugins are listed in `bundle.vim`, which is sourced by `vimrc`.


## Installation

Clone the repository:

    git clone https://github.com/smancill/Vim_config.git ~/.vim

Execute the installation script:

    cd ~/.vim
    ./install.sh

This script installs the plugin manager ([vim-plug][vim-plug]), downloads
and installs the plugins, and creates the symbolic links `~/.vimrc` and
`~/.gvimrc`.

### Prerequisites

Some plugins need external programs to work properly.

##### Source code tags

You need the *Exuberant Ctags* program:

    # Ubuntu
    sudo apt install exuberant-ctags

    # macOS
    brew install ctags

Press `<F8>` to [open a lateral window][tagbar]
with the tags of the current buffer ordered by scope,
or use `g[` to fuzzy search for a tag within the buffer.

##### Better *grep*

Install *Ack* to use the `:Ack[!]` command inside Vim as a replacement for
*grep*:

    # Ubuntu
    sudo apt install ack-grep

    # macOS
    brew install ack

See the [webpage][ack-web] for more information.
The [SilverSearcher](https://github.com/ggreer/the_silver_searcher) is also
supported as a replacement for `ack` if installed.

##### Syntax checking

[Syntastic][syntastic] provides automatic syntax
checking when saving the open file.

C/C++ files have automatic support with *GCC*.

To add support for Python files install *flake8*:

    # Ubuntu
    sudo apt install flake8

    # macOS
    python -m pip install flake8

To add support for LaTeX files install *LaCheck*:

    # Ubuntu
    sudo apt install lacheck

For shell script files, install *ShellCheck*:

    # Ubuntu
    sudo apt install shellcheck

    # macOS
    brew install shellcheck

##### C/C++ omnicompletion

The [clang_complete][clang_complete] plugin uses Clang for
accurately completing C and C++ code:

    # Ubuntu
    sudo apt install libclang-dev

It may be necessary to point to the location of the library:

```vim
let g:clang_library_path = '/usr/lib/llvm-3.8/lib'
```

### Updating to the latest version

Get the last commits from my repository:

    cd ~/.vim
    git pull origin master

Launch `vim` and run `:PlugInstall` to install new plugins, and `:PlugUpdate`
to update all plugins. See [vim-plug][vim-plug] documentation for more
details.

### Overwrite and extends this configuration

To add or remove plugins, create a file named `~/.vim/bundle.fork`
(if the repository is forked) or `~/.vim/bundle.local` (for a local-machine),
and put extra plugins in there:

```vim
" bundle.local: extra plugins for dev machine

" Remove ctrlp (UnPlug is defined in vimrc, not in vim-plug)
UnPlug 'kien/ctrlp.vim'

" Use fzf instead
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
```

To extend or change the configuration of `vimrc`,
create a file named `~/.vim/vimrc.fork` (if the repository is forked)
or `~/.vim/vimrc.local` (for a local-machine), and put extra settings in there:

```vim
" vimrc.local: extra settings for dev machine

" Override settings for plugins
let g:clang_user_options = '-DCLANG -std=c++11 -fcxx-exceptions'
let g:syntastic_cpp_compiler_options = '-std=c++11'

" Override Vim settings
set nonumber
set noexpandtab
set tabstop=8
```

Or `vimrc` and `bundle.vim` can be simply modified with the preferred
configuration, and then merged with any further updates to the repository.


## Features

The `.vimrc` file is well organized and folded by sections.  The options are:

* Restore position of cursor when opening files.
* Put swap files and undo files in `~/.cache/vim`.
* Set `hidden` to change between unsaved buffers.
* Use indentation of four spaces, not tabs.
* Backspace works in INSERT mode, and cursor moves to other lines.
* Use Unix file format and UTF-8 encoding for new files.
* Always show mode, status line, ruler and command.
* Better command line completion.
* Search words while typing, ignoring case.
* Better navigation for long lines.
* Do not backup files.
* Spelling for English and Spanish.

And several more, including configuration of used plugins.

### Navigating buffers

Vim uses buffers (`:help buffers`) to edit multiple files.
Use the following key mappings in normal mode to easily work with buffers.

* `<C-k>` is custom mapped to jump back to the previously edited file
  (see `:help alternate-file`).
* `<C-j>` is custom mapped to see the list of buffers.
  Navigate with the `j`/`k` keys, press `<Enter>` to open the buffer,
  or `d` to delete it (see [buffergator][buffergator]).
* `]b` to go to the next buffer in buffer list (see [vim-unimpaired][unimpaired]).
* `[b` to go to the previous buffer in buffer list (see [vim-unimpaired][unimpaired]).

See [Working with buffers](http://vimcasts.org/episodes/working-with-buffers/),
[Working with windows](http://vimcasts.org/episodes/working-with-windows/)
and [Working with tabs](http://vimcasts.org/episodes/working-with-tabs/)
for a quick introduction to Vim features for editing multiple files.

> Note that [using tabs in Vim](http://stackoverflow.com/a/26710166)
> [is different than](http://stackoverflow.com/a/103590)
> [opening tabs in other editors](https://sanctum.geek.nz/arabesque/buffers-windows-tabs/).

### Useful mappings

* ` ' ` and `` ` `` are exchanged for moving to marks.
* ` - ` opens the Vim built in directory browser (see [vinegar][vinegar]).
* `<F3>` toggles the NERDTree list of files (see [NERDtree][nerdtree]).
* `<C-space>` on insert mode to start completion based on context.


## Plugins

The following plugins are used (check `vimrc` for configuration details):

* [local-vimrc](https://github.com/MarcWeber/vim-addon-local-vimrc):
  simple local `vimrc` with hash protection (default filename changed to
  `.project.vim`).
* [Buffergator][buffergator]: list, select and switch between buffers
  (custom mapped to `<C-j>`).
* [ctrlp.vim][ctrlp]: full path fuzzy file, buffer, MRU and tag finder
  (use `<C-p>` to search files and `<C-n>` to search MRU files).
* [The NERD Tree][nerdtree]: a tree explorer (toggle with `<F3>` and find
    current file with `<leader><F3>`).
* [vinegar.vim][vinegar]: enhances the built in directory browser (open with `-`).
* [vim-airline][airline]: lean and mean status/tabline for Vim that's light as air.
* [Supertab][supertab]: perform all Vim insert mode completions with a single key
  (custom mapped to `<C-space>` instead of `<Tab>`).
* [UltiSnips][ultisnips]: the ultimate snippet solution
  (custom mapped to trigger with `<C-space>` and jump forward with `<Tab>`).
* [ack.vim](https://github.com/mileszs/ack.vim): front end for [ack][ack-web],
  a better grep.
* [EditorConfig Vim][editorconfig]: adds support for
  [EditorConfig](http://editorconfig.org) files.
* [fugitive.vim][fugitive]: an awesome Git wrapper
  (see custom mappings with `:map <leader>g`).
* [Gist][gist]: for creating [Gists][gist-web].
* [Syntastic][syntastic]: automatic syntax checking.
* [Mundo][mundo]: visualize the Vim undo tree (toggle with `<F5>`).
* [Gutentags][gutentags]: automatically manage the tag files.
* [Tagbar][tagbar]: a class outline viewer, displays tags in a window,
  ordered by scope (toggle with `<F8>`).
* [sideways.vim][sideways]: move function arguments left and right.
* [commentary.vim][commentary]: comment stuff out.
* [unimpaired.vim][unimpaired]: pairs of handy bracket mappings.
* [surround.vim][surround]: delete/change/add parentheses, quotes, tags, etc.
* [repeat.vim][repeat]: repeat supported plugin maps with "."
* [clang_complete][clang_complete]: omnicompletion for C/C++ files.
* [alternate][alternate]: alternate C source/header files quickly
* [jedi-vim][jedi-vim]: Python autocompletion with the Jedi library.
* [vimtex][vimtex]: a modern plugin for editing LaTeX files.
* [Previm][previm]: realtime preview of markup languages
  (open HTML on browser with `<F9>`).
* [vim-markdown][markdown_mode]: Markdown mode.


[vim-plug]: https://github.com/junegunn/vim-plug
[buffergator]: https://github.com/jeetsukumaran/vim-buffergator
[CtrlP]: http://kien.github.com/ctrlp.vim
[nerdtree]: https://github.com/scrooloose/nerdtree
[vinegar]: https://github.com/tpope/vim-vinegar
[airline]: https://github.com/vim-airline/vim-airline
[supertab]: https://github.com/ervandew/supertab
[ultisnips]: https://github.com/sirver/ultisnips
[editorconfig]: https://github.com/editorconfig/editorconfig-vim
[fugitive]: https://github.com/tpope/vim-fugitive
[gv]: https://github.com/junegunn/gv.vim
[gist]: https://github.com/mattn/gist-vim
[syntastic]: https://github.com/scrooloose/syntastic
[mundo]: https://github.com/simnalamburt/vim-mundo
[gutentags]: https://github.com/ludovicchabant/vim-gutentags
[tagbar]: https://github.com/majutsushi/tagbar
[sideways]: https://github.com/AndrewRadev/sideways.vim
[commentary]: https://github.com/tpope/vim-commentary
[unimpaired]: https://github.com/tpope/vim-unimpaired
[surround]: https://github.com/tpope/vim-surround
[repeat]: https://github.com/tpope/vim-repeat
[clang_complete]: https://github.com/Rip-Rip/clang_complete
[alternate]: https://github.com/vim-scripts/a.vim
[jedi-vim]: https://github.com/davidhalter/jedi-vim
[vimtex]: https://github.com/lervag/vimtex
[previm]: https://github.com/kannokanno/previm
[markdown_mode]: https://github.com/plasticboy/vim-markdown
[indent-guides]: https://github.com/nathanaelkane/vim-indent-guides

[ack-web]: http://betterthangrep.com
[gist-web]: https://gist.github.com

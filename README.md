# My configuration files for Vim 7.x

This is a distribution of Vim plugins and configurations to use VIM for
development. It is a replacement of my
[old config](https://github.com/smancill/Vimfiles), and it uses
[NeoBundle][NeoBundle] to have a well organized Vim directory and to manage
the plugins automatically.  The plugins are listed in `bundle.vim`, which is
sourced by `.vimrc`.

> **TODO:** update this README with the latests plugins and config

## Installation

Clone the repository:

    git clone git://github.com/smancill/Vim_config.git $HOME/.vim

Execute the installation script:

    source $HOME/.vim/install.sh

This script installs the plugin manager ([NeoBundle][NeoBundle]), downloads
and installs the plugins, and creates the symbolic links `$HOME/.vimrc` and
`$HOME/.gvimrc`

### Prerequisites

Some plugins need external programs to work properly.

#### Source code tags

You need the *Exuberant Ctags* program:

    $ sudo aptitude install ctags

Pressing `<F8>` will
[open a lateral window](http://majutsushi.github.com/tagbar)
with the tags of the current file ordered by scope.

#### Better *grep*

Install *Ack* to use the `:Ack[!]` command inside Vim as a replacement for
*grep*:

    sudo aptitude install ack-grep

See the [webpage](http://betterthangrep.com/) for more information.

#### Syntax checking

[Syntastic](https://github.com/scrooloose/syntastic) provides automatic syntax
checking when saving the open file.

To add support for Python files install *Pyflakes* (an alternative is
*flake8*, but it also checks for [PEP8](http://www.python.org/dev/peps/pep-0008)):

    sudo aptitude install pyflakes

To add support for LaTeX files install *LaCheck*

    sudo aptitude install lacheck

C/C++ files have automatic support with *GCC*.

#### C/C++ omnicompletion

The [clang_complete](https://github.com/Rip-Rip/clang_complete) uses Clang for
accurately completing C and C++ code:

    sudo aptitude install clang

The version 3.0 is recommended, but it is only on the repositories of *Ubuntu
12.04*.

#### Markup languages

Install Ruby dependencies for [Hammer](https://github.com/smancill/hammer.vim):

    $ sudo apt-get install rubygems
    $ sudo gem install github-markup tilt coderay albino

Install support for Markdown:

    $ sudo gem install redcarpet

Press `<F9>` to open the rendered document in a browser.

Check the project page to install dependencies for other markup languages.

### Updating to the latest version

Get the last commits from my repository:

    cd $HOME/.vim
    git pull origin master

Launch `vim` and run `:NeoBundleInstall!`.

You can do the same from the command line with:

```
    $ vim +NeoBundleInstall! +q
```

To add or remove plugins, just edit the file `$HOME/.vim/bundle.vim`. See the
[NeoBundle][NeoBundle] documentation for more details.


## Features

> **THE FOLLOWING SECTIONS ARE NOT COMPLETED YET**

The `.vimrc` file is well organized and folded by sections.  The options are:

* Restore position of cursor when opening files.
* Use indentation of four spaces, not tabs.
* Backspace works in INSERT mode, and cursor moves to other lines.
* Use Unix file format and UTF-8 encoding for new files.
* Always show mode, status line, ruler and command.
* Better command line completion.
* Search words while typing, ignoring case.
* Better navigation for long lines.
* Do not backup files.
* Spelling for english and spanish.

And several more, including configuration of used plugins.

> If you want to override some features of my `vimrc`, create the file
> `$HOME/.vim/vimrc_mine.vim` and put your settings there.

### Navigating buffers

Vim use buffers (`:help buffers`) to edit multiple files.  Use the following
commands in normal mode to easily work with buffers.

* `K` to jump back to the previously edited buffer.
* `M` to see the list of buffers.  Navigate with the arrow keys, press
  `<Enter>` to open the buffer, or `d` to delete it.
* `L` to go to the next buffer in buffer list.
* `H` to go to the previous buffer in buffer list.

Use `<space>h`, `<space>m` and `<space>l` to get the original behaviour of the
previous overwritten maps (go to the top, middle or bottom line of the window)

### Useful commands

* ` ' ` and `` ` `` are exchanged for moving to marks.
* `:CC` (command line) can be used as a quick python calculator.
* `<F3>` toggle the NERDTree list of files.
* `<F12>` toggle paste mode (`:help paste`)

## Plugins

The following plugins are used:

* [QuickBuf](https://github.com/vim-scripts/QuickBuf) (small and powerful
  buffer manager)
* [Powerline](https://github.com/Lokaltog/vim-powerline) (the ultimate Vim
  statusline utility)
* [Ctrlp](http://kien.github.com/ctrlp.vim) (Full path fuzzy file, buffer, mru
  and tag finder)
* [NerdTree](https://github.com/scrooloose/nerdtree) (a tree explorer)
* [UltiSnips](https://github.com/sirver/ultisnips) (the ultimate snippet
  solution)
* [Ack](https://github.com/mileszs/ack.vim) (front end for ack, a better grep)
* [Fugitive](https://github.com/tpope/vim-fugitive) (an awesome Git wrapper)
* [gitv](http://www.gregsexton.org/portfolio/gitv) (a gitk clone for Vim)
* [Gist](https://github.com/mattn/gist-vim) (for creating Gists)
* [Unimpaired](https://github.com/tpope/vim-unimpaired) (pairs of handy
  bracket mappings)
* [Surround](https://github.com/tpope/vim-surround) (delete/change/add
  parentheses, quotes, tags, etc)
* [Repeat](https://github.com/tpope/vim-repeat) (repeat supported plugin maps
  with ".")
* [Syntastic](https://github.com/scrooloose/syntastic) (automatic syntax
  checking)
* [TagBar](http://majutsushi.github.com/tagbar) (browsing the tags of source
  code)
* [Commentary](https://github.com/tpope/vim-commentary) (comment stuff out)
* [Hammer](https://github.com/smancill/hammer.vim) (process your markup
  language to HTML)
* [LaTeX-Suite](http://vim-latex.sourceforge.net/) (tools for editing LaTeX)
* [clang_complete](https://github.com/Rip-Rip/clang_complete) (best omnicompletion
  for C/C++ files)
* [alternate](https://github.com/vim-scripts/a.vim) (alternate C source/header
  files quickly)
* [PythonMatch](https://github.com/vim-scripts/python_match.vim) (extend the
  `%` motion for python files)
* [PyDoc](https://github.com/fs111/pydoc.vim) (integrates Python
  documentation)


[NeoBundle]: https://github.com/smancill/neobundle.vim

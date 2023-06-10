# Configuration for Vim 8+

This is a distribution of plugins and configuration to use Vim for development,
on Linux and macOS.
It uses [vim-plug][vim-plug] to manage the plugins automatically.
The plugins are listed in `bundle.vim`, which is sourced by `vimrc`.

> Most development support is now handled with language servers via [coc.nvim].
> To enable this experimental configuration, set the environment variable
> `VIM_CONFIG_USE_COC`.


## Installation

Clone the repository:

``` sh
$ git clone https://github.com/smancill/vim-config.git ~/.vim
```

Execute the installation script (curl is required):

``` sh
$ cd ~/.vim
$ ./install.sh
```

This script installs the plugin manager ([vim-plug][vim-plug]), downloads
and installs the plugins, and downloads spell files for English and Spanish.

### Prerequisites

<details>
<summary>Some plugins need external programs to work properly
<i>(click to expand/colapse)</i>.</summary>

##### Source code tags

You need the *Universal Ctags* program:

``` sh
# Ubuntu
$ sudo apt install universal-ctags

# macOS
$ brew install universal-ctags
```

Press `<F8>` to [open a lateral window][tagbar]
with the tags of the current buffer ordered by scope,
or use `g[` to fuzzy search for a tag within the buffer.

##### Better *grep*

Install *ack* to use the `:Ack[!]` command inside Vim as a replacement for
*grep*:

``` sh
# Ubuntu
$ sudo apt install ack-grep

# macOS
$ brew install ack
```

See the [webpage][ack-web] for more information.
[ripgrep](https://github.com/BurntSushi/ripgrep) is also
supported (and recommended) as a replacement for *ack* if installed.

##### Syntax checking

[ALE][ALE] provides automatic syntax checking
when saving the file.

C/C++ files have automatic support with *GCC*.

To add support for Python files install *flake8*:

``` sh
# Ubuntu
$ sudo apt install flake8

# macOS
$ brew install flake8
```

For shell script files, install *ShellCheck*:

``` sh
# Ubuntu
$ sudo apt install shellcheck

# macOS
$ brew install shellcheck
```

</details>

### Updating to the latest version

Fetch any changes from the repository:

``` sh
$ cd ~/.vim
$ git pull origin master
$ ./install -u
```

The script will start `vim` and run `:PlugUpdate`
to install new plugins and update the existing ones.
See [vim-plug][vim-plug] documentation for more details.

### Override and extend this configuration

To override settings,
create a directory `~/.vim/vendor` (for shared company-wide settings)
or a directory `~/.vim/private` (for private local settings).
They will be added to the `runtimepath`.
If both are used, the `private` settings will override those in `vendor`.

#### Override plugins

To add or remove plugins,
create a file named `~/.vim/vendor/bundle.vim` (for shared company-wide plugins)
or `~/.vim/private/bundle.vim` (for local-machine plugins),
and put extra plugins in there:

```vim
" Remove ctrlp (UnPlug is defined in vimrc, not in vim-plug)
UnPlug 'kien/ctrlp.vim'

" Use fzf instead
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
```

#### Override global settings

To extend or change the configuration of `vimrc`,
create a file named `~/.vim/vendor/vimrc` (for shared company-wide configuration)
or `~/.vim/private/vimrc` (for a local-machine configuration),
and put extra settings in there:

```vim
" Override settings for plugins
let g:ale_cpp_gcc_options = '-std=c++11'

" Override Vim settings
set nonumber
set noexpandtab
set tabstop=8
```

#### Override filetype settings, etc

Since `~/.vim/vendor` and `~/.vim/private` are added to the `runtimepath`,
simply create the files in their expected locations,
and they will be sourced by normal Vim initialization.

Examples:

- `~/.vim/vendor/after/ftplugin/javascript.vim` (company-wide JavaScript settings)
- `~/.vim/private/after/ftplugin/html.vim` (local-machine HTML settings)
- `~/.vim/vendor/autoload/company.vim` (company-wide Vim functions)
- `~/.vim/private/plugin/plugin.vim` (local-machine custom plugin)


## Features

The [`vimrc`](vimrc) sets the following options:

* Restore position of cursor when opening files.
* Put swap, backup and undo files in `$XDG_STATE_HOME/vim/{swap,backup,undo}`.
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

And several more.

Configuration for used plugins can be found in [`bundle.vim`](bundle.vim).

### Navigating buffers

Vim uses buffers ([`:help buffers`][h-buffers]) to edit multiple files.
Use the following key mappings in normal mode to easily work with buffers.

* `<C-K>` is custom mapped to jump back to the previously edited file
  (see [`:help alternate-file`][h-alternate]).
* `<C-J>` is custom mapped to see the list of buffers.
  Navigate with the `j`/`k` keys, press `<Enter>` to open the buffer,
  or `d` to delete it (see [buffergator][buffergator]).
* `]b` to go to the next buffer in buffer list (see [vim-unimpaired-slim][unimpaired]).
* `[b` to go to the previous buffer in buffer list (see [vim-unimpaired-slim][unimpaired]).

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
* `<C-Space>` on insert mode to start completion based on context.


## Plugins

The following plugins are used (check [`bundle.vim`](bundle.vim) for configuration details):

* [local-vimrc](https://github.com/MarcWeber/vim-addon-local-vimrc):
  simple local `vimrc` with hash protection (`.vimrc` and `.project.vim`
  supported).
* [Buffergator][buffergator]: list, select and switch between buffers
  (custom mapped to `<C-J>`).
* [ctrlp.vim][ctrlp]: full path fuzzy file, buffer, MRU and tag finder
  (use `<C-P>` to search files and `<C-N>` to search MRU files).
* [The NERD Tree][nerdtree]: a tree explorer (toggle with `<F3>` and find
    current file with `<Leader><F3>`).
* [vinegar.vim][vinegar]: enhances the built in directory browser (open with `-`).
* [vim-airline][airline]: lean and mean status/tabline for Vim that's light as air.
* [Supertab][supertab]: perform all Vim insert mode completions with a single key
  (custom mapped to `<C-Space>` instead of `<Tab>`).
* [UltiSnips][ultisnips]: the ultimate snippet solution
  (custom mapped to trigger with `<C-Space>` and jump forward with `<Tab>`).
* [ack.vim](https://github.com/mileszs/ack.vim): front end for [ack][ack-web],
  a better grep.
* [EditorConfig Vim][editorconfig]: adds support for
  [EditorConfig](http://editorconfig.org) files.
* [fugitive.vim][fugitive]: an awesome Git wrapper
  (see custom mappings with `:map <Leader>g`).
* [ALE][ale]: Asynchronous linting/fixing.
* [Mundo][mundo]: visualize the Vim undo tree (toggle with `<F5>`).
* [Gutentags][gutentags]: automatically manage the tag files.
* [Tagbar][tagbar]: a class outline viewer, displays tags in a window,
  ordered by scope (toggle with `<F8>`).
* [sideways.vim][sideways]: move function arguments left and right.
* [commentary.vim][commentary]: comment stuff out.
* [unimpaired.vim][unimpaired]: pairs of handy bracket mappings
  (custom slim version)
* [surround.vim][surround]: delete/change/add parentheses, quotes, tags, etc.
* [repeat.vim][repeat]: repeat supported plugin maps with `.`.


[vim-plug]: https://github.com/junegunn/vim-plug
[coc.nvim]: https://github.com/neoclide/coc.nvim
[buffergator]: https://github.com/jeetsukumaran/vim-buffergator
[ctrlp]: https://github.com/ctrlpvim/ctrlp.vim
[nerdtree]: https://github.com/scrooloose/nerdtree
[vinegar]: https://github.com/tpope/vim-vinegar
[airline]: https://github.com/vim-airline/vim-airline
[supertab]: https://github.com/ervandew/supertab
[ultisnips]: https://github.com/sirver/ultisnips
[editorconfig]: https://github.com/editorconfig/editorconfig-vim
[fugitive]: https://github.com/tpope/vim-fugitive
[gist]: https://github.com/mattn/gist-vim
[ale]: https://github.com/w0rp/ale
[mundo]: https://github.com/simnalamburt/vim-mundo
[gutentags]: https://github.com/ludovicchabant/vim-gutentags
[tagbar]: https://github.com/majutsushi/tagbar
[sideways]: https://github.com/AndrewRadev/sideways.vim
[commentary]: https://github.com/tpope/vim-commentary
[unimpaired]: https://github.com/smancill/vim-unimpaired-slim
[surround]: https://github.com/tpope/vim-surround
[repeat]: https://github.com/tpope/vim-repeat

[ack-web]: http://betterthangrep.com

[h-buffers]: https://vimhelp.org/windows.txt.html#buffers
[h-alternate]: https://vimhelp.org/editing.txt.html#alternate-file

py3 << endpy3
import os
import vim

from UltiSnips import snippet_manager
from UltiSnips import vim_helper

_vim_config_old_select_snips_file = snippet_manager._select_and_create_file_to_edit

def _vim_config_override_select_snips_file(potentials):
    if vim_helper.eval("exists('g:UltiSnipsSnippetsDir')") != "0":
        default_snippets_dir = os.path.join(vim_helper.get_dot_vim(), "UltiSnips")
        user_snippets_dir = os.path.expanduser(vim_helper.eval("g:UltiSnipsSnippetsDir"))
        potentials = {
            snf.replace(default_snippets_dir, user_snippets_dir)
            for snf in potentials
        }
    return _vim_config_old_select_snips_file(potentials)

snippet_manager._select_and_create_file_to_edit = _vim_config_override_select_snips_file
endpy3

function! override#UltiSnips#Edit(bang, ...) abort
  call call(function("UltiSnips#Edit"), [a:bang] + a:000)
endfunction

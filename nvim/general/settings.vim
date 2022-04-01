" enable mouse navigation
set mouse=a
set listchars=tab:>·,trail:·,extends:>,precedes:<
set list

function! Uuid()
python <<EOF
import uuid, vim
vim.command("normal i" + str(uuid.uuid4()))
EOF
endfunction

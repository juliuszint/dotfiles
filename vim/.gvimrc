if has("win32") 
    :set guifont=DejaVu_Sans_Mono:h10:cANSI:qDRAFT
    :set guioptions-=m       " remove menu bar
    :set guioptions-=T       " remove toolbar
    :set guioptions-=r       " remove right-hand scroll bar
    :set guioptions-=L       " remove left-hand scroll bar
    :au GUIEnter * simalt ~x " launch gvim in fullscreen
    :colorscheme visualstudio
endif

if has('gui_macvim') 
    :set guifont=DejaVu\ Sans\ Mono:h14
    :set guioptions=
    :macmenu File.Save key=<nop>
    :macmenu File.New\ Tab key=<nop>
    :macmenu File.New\ Window key=<nop>
    ":macmenu File.Open... key=<nop>
    ":macmenu File.Open\ Tab key=<nop>
    ":macmenu File.Save\ As Tab key=<nop>
    ":macmenu File.Close\ Window key=<nop>
    :macmenu File.Close key=<nop>
    :macmenu File.Print key=<nop>
    ":macmenu MacVim.Hide key=<nop>

    :macmenu Edit.Copy key=<nop>
    :macmenu Edit.Paste key=<nop>
    :macmenu Edit.Cut key=<nop>
    :macmenu Edit.Select\ All key=<nop>
    :macmenu Tools.List\ Errors key=<nop>
    :macmenu Tools.Make key=<nop>

    :let g:OmniSharp_server_path = '/usr/local/omnisharp/run'
    :colorscheme caseymuratori
    :set fu
endif

:set guicursor+=n-v-c:blinkon0

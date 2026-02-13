unmap <Space>

imap jk <Esc>

set clipboard=unnamed

exmap back obcommand app:go-back
nmap <C-o> :back
exmap forward obcommand app:go-forward
nmap <C-i> :forward

exmap surround_wiki surround [[ ]]
exmap surround_double_quotes surround " "
exmap surround_single_quotes surround ' '
exmap surround_brackets surround ( )
exmap surround_square_brackets surround [ ]
exmap surround_curly_brackets surround { }

map [[ :surround_wiki
vunmap S
vmap S" :surround_double_quotes
vmap S' :surround_single_quotes
vmap Sb :surround_brackets
vmap S( :surround_brackets
vmap S) :surround_brackets
vmap S[ :surround_square_brackets
vmap S[ :surround_square_brackets
vmap S{ :surround_curly_brackets
vmap S} :surround_curly_brackets

" Split Window
exmap split_vertical obcommand workspace:split-vertical
nmap sv :split_vertical
exmap split_horizontal obcommand workspace:split-horizontal
nmap ss :split_horizontal

" Quit Buffer
exmap q obcommand workspace:close

" Map to Open File
exmap open_file obcommand switcher:open 
nmap <Space>sf :open_file

" Go Into Link
exmap goto_link obcommand editor:follow-link
nmap gd :goto_link

" Focus Panes (like vim splits)
exmap focus_top obcommand editor:focus-top
nmap <C-k> :focus_top
exmap focus_bottom obcommand editor:focus-bottom
nmap <C-j> :focus_bottom
exmap focus_left obcommand editor:focus-left
nmap <C-h> :focus_left
exmap focus_right obcommand editor:focus-right
nmap <C-l> :focus_right

" Window Management
exmap open_in_new_window obcommand workspace:open-in-new-window
nmap <Space>wn :open_in_new_window
exmap move_to_new_window obcommand workspace:move-to-new-window
nmap <Space>wm :move_to_new_window

" Tab Navigation
exmap next_tab obcommand workspace:next-tab
nmap gt :next_tab
exmap prev_tab obcommand workspace:previous-tab
nmap gT :prev_tab
exmap last_tab obcommand workspace:goto-last-tab
nmap <Space>tl :last_tab
exmap new_tab obcommand workspace:new-tab
nmap <Space>tn :new_tab

" Search
exmap search obcommand editor:open-search
nmap / :search
exmap search_replace obcommand editor:open-search-replace
nmap <Space>sr :search_replace
exmap global_search obcommand global-search:open
nmap <Space>sg :global_search

" Sidebar & Panels
exmap file_explorer obcommand file-explorer:open
nmap <Space>e :file_explorer
exmap tag_pane obcommand tag-pane:open
nmap <Space>st :tag_pane

" Graph & Notes
exmap graph obcommand graph:open
nmap <Space>og :graph
exmap daily_note obcommand daily-notes
nmap <Space>od :daily_note


Movement:
	- <j> down
	- <k> up
	- <h> left
	- <l> right

	- <xx-G> goto Line number xx
	- <G> goto End of the File

	- (pref) <C-r> (relative Mode) + < xx - j/k > Move xx up/down

Modi:
	- <ESC> Normal Mode
	- <i> Insert Mode
	- <v> Visual Mode

File:
	- :q close File
	- <ZZ> :wq save and close File
	- <C-s> :w save File
	- :q! close without saving

Custom:
	- <C-e> toggle side numbers
	- <C-t> toggles Nerdtree
	- <C-a> runs the file
	- <C-r> toggle relative numbers
	- <S-TAB> <C-t> indent
	- <leader> + <p> + <s> opens Packer Status

LSP:
	- <Tab> Move down the List
	- <S-q> Move up the List

Lightspeed:
	- <s> Search Mode
	- type word


MultiLine:
	- <v> + < indents to the left
	- <v> + > indents to the right

MultiLine Cursor:
	- <C-n> Select Line
	- <C-n> + <C-up/down> Select Lines
	- <i> Insert Mode with Multi Cursor
	- <Esc> Quit

Comment:
	- <gcc> current line Comment
	- <gbc> current line blockwise Comment
	--> Visual Mode + <gcc> 

Copy:
	- <v> + <C-c> Copies to Clipboard
	- <v> + <y / yy> Just for use in file

Handle Splitscreen:
	- :vert h [file]
	- <C-w> --> whichkey



Updating Neovim:
	https://ecalzo.is-a.dev/Nvim-on-WSL2/
	sudo add-apt-repository ppa:neovim-ppa/stable
	sudo apt-get update
	sudo apt-get install neovim



Startuptime:
	- Terminal: nvim --startuptime startup.log -c exit && tail -100 startup.log

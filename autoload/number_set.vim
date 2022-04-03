
let g:state = 0
function number_set#relative_numb()
	"rnu === relativenumber
	if g:state == 0 
		execute 'set rnu'
		let g:state = 1
	else
		execute 'set nornu'
		let g:state = 0
	endif
endfunction

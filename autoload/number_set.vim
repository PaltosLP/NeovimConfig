
let g:r_state = 0
function number_set#relative_numb()
	"rnu === relativenumber
	if g:r_state == 0 
		execute 'set rnu!'
		let g:r_state = 1
	else
		execute 'set nornu!'
		let g:r_state = 0
	endif
endfunction


let g:n_state = 0
function number_set#normal_numb()
	"nu === number
	if g:n_state == 0
		execute 'set nonu!'
		let g:n_state = 1
	else
		execute 'set nu!'
		let g:n_state = 0
	endif
endfunction

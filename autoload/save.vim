
function save#w()
	execute 'w'
endfunction

function save#pwd()

	let var = ""
	redir => var
	silent execute "!pwd"
	redir END

	echo var

endfunction

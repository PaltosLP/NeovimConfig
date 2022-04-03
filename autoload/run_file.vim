

function run_file#Run_File()
	let filetype = expand('%:e')
	let file_name = expand('%:t:r')
	let full_file_name = file_name .".". filetype
	"let c_command3 = "!clear"
	let ex_list = ['py','c','cpp']
	let exable = 0
	"if filetype in ex_list
	for i in range(len(ex_list))
		if filetype == ex_list[i]
			let exable = 1
		endif
	endfor
	
	if exable == 1
		if filetype == "py"
			execute "!python3 " . full_file_name
		elseif filetype == "c"
			execute "!gcc " . full_file_name . " -o " . "executable_c" 
			execute "!./executable_c"
			execute "!rm executable_c"
		elseif filetype == "cpp"
			execute "!g++ " . full_file_name . " -o" . "executable_cpp"
			execute "!./executable_cpp"
			execute "!rm executable_cpp"
		endif	
	else
		echo filetype
	endif
endfunction



function run_file#w()
	execute 'w'
endfunction


function run_file#relative_numb()
	execute 'set relativenumber'	
endfunction

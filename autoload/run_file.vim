
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
			silent exec "!gcc " . full_file_name . " -o " . "executable_c"
			let var = ""
			redir => var
			silent call C_exe()
			redir END
			silent exec "!rm executable_c"
			echo var
		elseif filetype == "cpp"
			silent execute "!g++ " . full_file_name . " -o" . "executable_cpp"	
			let var = ""
			redir => var
			silent call Cpp_exe()
			redir END
			silent execute "!rm executable_cpp"
			echo var
		endif

		elseif filetype == "go"
			silent exec "!go build -o " . "executable_go " . full_file_name
			let var = ""
			redir => var
			silent call Go_exe()
			redir END
			silent exec "!rm executable_go"
			echo var
		


	else
		echo filetype
	endif
endfunction


function C_exe()
	silent exec "!./executable_c"	
endfunction

function Cpp_exe()
	silent execute "!./executable_cpp"
endfunction

function Go_exe()
	silent execute "!./executable_go"
endfunction

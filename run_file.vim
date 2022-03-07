function Run_File()
	let filetype = expand('%:e')
	let file_name = expand('%:t:r')
	let full_file_name = file_name .".". filetype
	"let c_command3 = "!clear"
	if filetype == "py"
		execute "!python3 " . full_file_name
	elseif filetype == "vim"
		echo "vim"
	elseif filetype == "lua"
		echo "lua"
	elseif filetype == "c"
		execute "!gcc " . full_file_name . " -o " . "executable_c" 
		execute "!./executable_c"
		execute "!rm executable_c"
	elseif filetype == "cpp"
		execute "!g++ " . full_file_name . " -o" . "executable_cpp"
		execute "!./executable_cpp"
		execute "!rm executable_cpp"
	endif	
endfunction



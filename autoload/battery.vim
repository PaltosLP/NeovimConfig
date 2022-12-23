"current battery: "cat /sys/class/power_supply/battery/capacity"
"charging or not: "cat /sys/class/power_supply/battery/status"


	
function battery#current_batt()
	let var = ""
	redir => var
	silent execute "!cat /sys/class/power_supply/battery/capacity"
	redir END
	" silent exec "!rm executable_go"
	return var
endfunction

function battery#is_charging()
	let var = ""
	redir => var
	silent execute "!cat /sys/class/power_supply/battery/status"
	redir END
	" silent exec "!rm executable_go"
	echo var

	if var == "Charging"
		echo "1"
	elseif var == "Discharging"
		echo "0"
	endif

endfunction

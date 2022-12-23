local utils = {}


utils.read_file = function(path)
    local file = io.open(path, "rb") -- r read mode and b binary mode
    if not file then return nil end
    local content = file:read "*a" -- *a or *all reads the whole file
    file:close()
    return content
end
--/sys/class/power_supply/battery/capacity
-- local battery = read_file("/sys/class/power_supply/battery/capacity")
-- local charging = read_file("/sys/class/power_supply/battery/status")

utils.is_charging = function()
	local charging = utils.read_file("/sys/class/power_supply/battery/status")
	local is = string.find(tostring(charging), "Dis")

	if is ~= nil then
		return false
	end

	return true
end


return utils

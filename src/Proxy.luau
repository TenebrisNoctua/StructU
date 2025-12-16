--!native

-- Written by @TenebrisNoctua
-- Creates a proxy for the buffer object, so metamethods can be applied.

--// Variables

local Types = require('./Types')

--// Types

type anyTable = Types.anyTable

--// Return Constructor

return function(metatable: anyTable)
	--[[
	-- To use it with userdata proxy, replace the code below this area.
	
	local object = newproxy(true)
	local mt = getmetatable(object)
	
	for key, metamethod in metatable do
		mt[key] = metamethod	
	end
	
	metatable.__metatable = "This metatable is locked."
	
	return object
	--]]
	
	metatable.__metatable = "This metatable is locked."
	
	return setmetatable({}, metatable)
end
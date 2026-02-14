-- Written by @TenebrisNoctua
-- DataType module for booleans

local readu8 = buffer.readu8
local writeu8 = buffer.writeu8

--// Return Handler

return table.freeze({
	size = 1,
	default = false,
	requiredType = "boolean",
	
	read = @native function(buf: buffer, cursor: number)
		return readu8(buf, cursor) == 1
	end,
	write = @native function(buf: buffer, cursor: number, value: boolean)
		writeu8(buf, cursor, if value then 1 else 0)
	end
})
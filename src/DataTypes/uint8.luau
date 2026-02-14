-- Written by @TenebrisNoctua
-- DataType module for uint8

local readu8 = buffer.readu8
local writeu8 = buffer.writeu8

--// Return Handler

return table.freeze({
	size = 1,
	default = 0,
	requiredType = "number",
	
	read = @native function(buf: buffer, cursor: number)
		return readu8(buf, cursor)
	end,
	write = @native function(buf: buffer, cursor: number, value: number)
		writeu8(buf, cursor, value)
	end
})
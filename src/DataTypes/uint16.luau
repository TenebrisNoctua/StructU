-- Written by @TenebrisNoctua
-- DataType module for uint16

local readu16 = buffer.readu16
local writeu16 = buffer.writeu16

--// Return Handler

return table.freeze({
	size = 2,
	default = 0,
	requiredType = "number",
	
	read = @native function(buf: buffer, cursor: number)
		return readu16(buf, cursor)
	end,
	write = @native function(buf: buffer, cursor: number, value: number)
		writeu16(buf, cursor, value)
	end
})
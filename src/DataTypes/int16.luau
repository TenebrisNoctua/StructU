-- Written by @TenebrisNoctua
-- DataType module for int16

local readi16 = buffer.readi16
local writei16 = buffer.writei16

--// Return Handler

return table.freeze({
	size = 2,
	default = 0,
	requiredType = "number",
	
	read = @native function(buf: buffer, cursor: number)
		return readi16(buf, cursor)
	end,
	write = @native function(buf: buffer, cursor: number, value: number)
		writei16(buf, cursor, value)
	end
})
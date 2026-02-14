-- Written by @TenebrisNoctua
-- DataType module for int8

local readi8 = buffer.readi8
local writei8 = buffer.writei8

--// Return Handler

return table.freeze({
	size = 1,
	default = 0,
	requiredType = "number",
	
	read = @native function(buf: buffer, cursor: number)
		return readi8(buf, cursor)
	end,
	write = @native function(buf: buffer, cursor: number, value: number)
		writei8(buf, cursor, value)
	end
})
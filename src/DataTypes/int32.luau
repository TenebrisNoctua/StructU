-- Written by @TenebrisNoctua
-- DataType module for int32

local readi32 = buffer.readi32
local writei32 = buffer.writei32

--// Return Handler

return table.freeze({
	size = 4,
	default = 0,
	requiredType = "number",
	
	read = @native function(buf: buffer, cursor: number)
		return readi32(buf, cursor)
	end,
	write = @native function(buf: buffer, cursor: number, value: number)
		writei32(buf, cursor, value)
	end
})
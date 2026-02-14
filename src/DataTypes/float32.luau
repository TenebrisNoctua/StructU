-- Written by @TenebrisNoctua
-- DataType module for float32

local readf32 = buffer.readf32
local writef32 = buffer.writef32

--// Return Handler

return table.freeze({
	size = 4,
	default = 0,
	requiredType = "number",
	
	read = @native function(buf: buffer, cursor: number)
		return readf32(buf, cursor)
	end,
	write = @native function(buf: buffer, cursor: number, value: number)
		writef32(buf, cursor, value)
	end
})
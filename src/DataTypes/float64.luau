-- Written by @TenebrisNoctua
-- DataType module for float64

local readf64 = buffer.readf64
local writef64 = buffer.writef64

--// Return Handler

return table.freeze({
	size = 8,
	default = 0,
	requiredType = "number",
	
	read = @native function(buf: buffer, cursor: number)
		return readf64(buf, cursor)
	end,
	write = @native function(buf: buffer, cursor: number, value: number)
		writef64(buf, cursor, value)
	end
})
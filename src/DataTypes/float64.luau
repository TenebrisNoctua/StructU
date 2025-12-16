-- Written by @TenebrisNoctua
-- DataType module for float64

--// Return Handler

return table.freeze({
	size = 8,
	default = 0,
	requiredType = "number",
	
	read = @native function(buf: buffer, cursor: number)
		return buffer.readf64(buf, cursor)
	end,
	write = @native function(buf: buffer, cursor: number, value: number)
		buffer.writef64(buf, cursor, value)
	end
})
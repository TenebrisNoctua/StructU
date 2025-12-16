-- Written by @TenebrisNoctua
-- DataType module for float32

--// Return Handler

return table.freeze({
	size = 4,
	default = 0,
	requiredType = "number",
	
	read = @native function(buf: buffer, cursor: number)
		return buffer.readf32(buf, cursor)
	end,
	write = @native function(buf: buffer, cursor: number, value: number)
		buffer.writef32(buf, cursor, value)
	end
})
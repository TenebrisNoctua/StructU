-- Written by @TenebrisNoctua
-- DataType module for int16

--// Return Handler

return table.freeze({
	size = 2,
	default = 0,
	requiredType = "number",
	
	read = @native function(buf: buffer, cursor: number)
		return buffer.readi16(buf, cursor)
	end,
	write = @native function(buf: buffer, cursor: number, value: number)
		buffer.writei16(buf, cursor, value)
	end
})
-- Written by @TenebrisNoctua
-- DataType module for uint32

--// Return Handler

return table.freeze({
	size = 4,
	default = 0,
	requiredType = "number",
	
	read = @native function(buf: buffer, cursor: number)
		return buffer.readu32(buf, cursor)
	end,
	write = @native function(buf: buffer, cursor: number, value: number)
		buffer.writeu32(buf, cursor, value)
	end
})
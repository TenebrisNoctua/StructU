-- Written by @TenebrisNoctua
-- DataType module for int64

local readi32 = buffer.readi32
local writei32 = buffer.writei32

--// Return Handler

return table.freeze({
	size = 8,
	default = 0,
	requiredType = "number",

	read = @native function(buf: buffer, cursor: number)
		local low = readi32(buf, cursor)
		if low < 0 then low += 0x100000000 end
		
		local high = readi32(buf, cursor + 4)
		return high * 4294967296 + low
	end,

	write = @native function(buf: buffer, cursor: number, value: number)
		local low = value % 4294967296
		if low < 0 then low += 4294967296 end
		
		local low_s = low
		if low >= 0x80000000 then low_s -= 0x100000000 end

		local high = (value - low) // 4294967296
		if high >= 0x80000000 then
			high -= 0x100000000
		elseif high < -0x80000000 then
			high = ((high + 0x80000000) % 0x100000000) - 0x80000000
		end

		writei32(buf, cursor, low_s)
		writei32(buf, cursor + 4, high)
	end
})
-- Written by @TenebrisNoctua
-- Contains the types which will be used within the library.

--// Essential Types

export type anyTable = {[any]: any}

export type dataType<T> = {
	read size: number,
	read default: any,
	read requiredType: string,
	read ref: any?,
	
	read write: (buf: buffer, cursor: number, value: any) -> (),
	read read: (buf: buffer, cursor: number) -> T
}

--// Library Type

export type StructU = {
	struct: <T>(structData: T) -> (dataTable: T?) -> T,
	string: (size: number) -> string,
	int8: number,
	int16: number,
	int32: number,
	uint8: number,
	uint16: number,
	uint32: number,
	float32: number,
	float64: number,
	bool: boolean
}

return nil
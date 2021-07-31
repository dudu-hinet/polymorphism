struct Struct<T: Decodable>: Decodable {
	let t: T
}
class SuperClass<T: Decodable> {
	func go() -> Struct<T> {
		fatalError("Must Override")
	}
}
class StringClass: SuperClass<String> {
	override func go() -> Struct<String> {
		return Struct(t: "123")
	}
}
class IntClass: SuperClass<Int> {
	override func go() -> Struct<Int> {
		return Struct(t: 123)
	}
}
func test() {
	let sc = StringClass()
	let ic = IntClass()
	let array: Array<SuperClass<Decodable>> = [sc, ic]	// <- 這裡放不進去
	for a in array {
		print(a.go().t)
	}
}

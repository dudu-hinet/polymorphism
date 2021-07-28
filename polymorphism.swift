import UIKit

struct Struct<T: Decodable>: Decodable {
	let t: T
}
protocol MyProtocol {
	associatedtype T: Decodable
	func go() -> Struct<T>
}
class StringClass: MyProtocol {
	func go() -> Struct<String> {
		return Struct(t: "a string")
	}
}
class IntClass: MyProtocol {
	func go() -> Struct<Int> {
		return Struct(t: 123)
	}
}
func test(){
	let sc = StringClass()
	let ic = IntClass()
	let array: Array<MyProtocol> = [sc, ic]	// <- 這裡放不進去
	for a in array {
		print(a.go().t)
	}
}

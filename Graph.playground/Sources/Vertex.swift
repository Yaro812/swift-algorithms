
import Foundation

public struct Vertex<T>: Equatable where T: Hashable {
    var index: Int
    var data: T
    
    public static func ==<T>(lhs: Vertex<T>, rhs: Vertex<T>) -> Bool {
        return lhs.index == rhs.index && lhs.data == rhs.data
    }
    
}

extension Vertex: CustomStringConvertible {
    public var description: String {
        return "Vertex <idx: \(index); data: \(data)>"
    }
}

extension Vertex: Hashable {
    public var hashValue: Int {
        return "\(data)\(index)".hashValue
    }
}

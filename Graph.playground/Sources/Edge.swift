
import Foundation

public struct Edge<T>: Equatable where T: Hashable {
    
    public let from: Vertex<T>
    public let to: Vertex<T>
    
    public let weight: Double?
    
    public static func == <T>(lhs: Edge<T>, rhs: Edge<T>) -> Bool {
        return lhs.from == rhs.from && lhs.to == rhs.to && lhs.weight == rhs.weight
    }
    
}

extension Edge: CustomStringConvertible {
    public var description: String {
        guard let weight = weight else {
            return "\(from.description) -> \(to.description)"
        }
        
        return "\(from.description) -(\(weight))-> \(to.description)"
    }
    
}

extension Edge: Hashable {
    public var hashValue: Int {
        var string = "\(from.description)\(to.description)"
        if let weight = weight {
            string.append("\(weight)")
        }
        return string.hashValue
    }
}



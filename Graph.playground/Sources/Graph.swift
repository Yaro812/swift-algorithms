import Foundation

protocol GraphLike {
    associatedtype T: Hashable
    
    var vertices: [Vertex<T>] { get set }
    var edges: [Edge<T>] { get set }
    
    func addVertex(with data: T) -> Vertex<T>
    func addDirectedEdge(from: Vertex<T>, to: Vertex<T>, weight: Double?)
    func addUndirectedEdge(between vertex1: Vertex<T> and vertex2: Vertex<T>, weight: Double?)
    func weight(from sourceVertex: Vertex<T>, to destinationVertex: Vertex<T>) -> Double?
    func edges(from vertex: Vertex<T>) -> [Edge<T>]
}

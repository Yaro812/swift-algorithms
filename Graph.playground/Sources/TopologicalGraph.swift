
import Foundation

struct TopologicalGraph<T>: GraphLike {
    var vertices: [Vertex<T>] = []
    var edges: [Edge<T>] = []
    
    var adjacencyList: [Vertex<T>: [Vertex<T>]] = []
    
    
}

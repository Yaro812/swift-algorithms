//: Playground - noun: a place where people can play

import UIKit

class Node<T: Comparable>: CustomStringConvertible {
    var value: T
    var left: Node<T>?
    var right: Node<T>?
    weak var parent: Node<T>?
    
    var isLeaf: Bool { return left == nil && right == nil }
    var isLeftChild: Bool { return parent?.left === self }
    var isRightChild: Bool { return parent?.right === self }
    var count: Int { return (left?.count ?? 0) + 1 + (right?.count ?? 0) }
    var minimum: Node { return left?.minimum ?? self }
    var maximum : Node { return right?.maximum ?? self }
    
    var sortedArray: [T] {
        var result: [T] = []
        left.flatMap { result += $0.sortedArray }
        result.append(value)
        right.flatMap { result += $0.sortedArray }
        return result
    }
    
    var depth: Int {
        var result = 1
        if let left = left, let right = right {
            result += max(left.depth, right.depth)
        } else if let left = left {
            result += left.depth
        } else if let right = right {
            result += right.depth
        }
        return result
    }
    
    var description: String {
        if left == nil && right == nil { return "<leaf: \(value)>" }
        return """
        <\(left.flatMap { String(describing: $0.value) } ?? "nil");\
        \(value);\
        \(right.flatMap { String(describing: $0.value) } ?? "nil")>
        """
    }
    
    func search(value: T) -> Node? {
        if value < self.value {
            return left?.search(value: value)
        } else if value > self.value {
            return right?.search(value: value)
        } else {
            return self
        }
    }
    
    @discardableResult public func remove() -> Node? {
        let replacement: Node?
        if let right = right {
            replacement = right.minimum
        } else if let left = left {
            replacement = left.maximum
        } else {
            replacement = nil
        }
        
        replacement?.remove()
        replacement?.right = right
        replacement?.left = left
        right?.parent = replacement
        left?.parent = replacement
        reconnectParentTo(node: replacement)
        parent = nil
        left = nil
        right = nil
        
        return replacement
    }
    
    func change(transform: (T) -> T) {
        left?.change(transform: transform)
        value = transform(value)
        right?.change(transform: transform)
    }
    
    init(value: T) {
        self.value = value
    }
    
    private func reconnectParentTo(node: Node?) {
        if let parent = parent {
            if isLeftChild {
                parent.left = node
            } else {
                parent.right = node
            }
        }
        node?.parent = parent
    }
}

class BinaryTree<T: Comparable>: CustomStringConvertible {
    var root: Node<T>?
    
    var count: Int { return root?.count ?? 0 }
    
    var description: String {
        guard let root = root else {
            return "\(type(of: self)): empty"
        }
        
        return "\(type(of: self)): root: \(root.value)"
    }
    
    var sortedArray: [T] {
        return root?.sortedArray ?? []
    }
    
    var depth: Int {
        return root?.depth ?? 0
    }
    
    var leftDepth: Int {
        return root?.left?.depth ?? 0
    }
    
    var rightDepth: Int {
        return root?.right?.depth ?? 0
    }
    
    func add(value: T) {
        guard var node = root else {
            root = Node(value: value)
            return
        }
        
        while true {
            if value <= node.value {
                if let left = node.left {
                    node = left
                } else {
                    node.left = Node(value: value)
                    break
                }
            } else if value > node.value {
                if let right = node.right {
                    node = right
                } else {
                    node.right = Node(value: value)
                    break
                }
            }
            
            // check if balance needed
            if abs(leftDepth - rightDepth) > 2 { balance() }
        }
    }
    
    func add(array: [T]) {
        array.forEach { self.add(value: $0) }
    }
    
    private func balance() {
        // Day–Stout–Warren algorithm
    }
    
}

let tree: BinaryTree<Int> = BinaryTree()
tree.add(value: 1)

tree.add(value: 2)
tree.add(value: 3)
tree.add(value: 4)
tree.add(value: 5)
tree.add(value: 6)
tree.add(value: 7)
tree.add(value: 8)
tree.add(value: 9)
tree.add(value: 10)
tree.add(value: 11)

tree.sortedArray

tree.root?.minimum
tree.root?.maximum
tree.root?.search(value: 6)?.remove()
tree.sortedArray

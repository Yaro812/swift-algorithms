//: LinkedList

import Foundation

class ListNode<T>: CustomStringConvertible {
    var next: ListNode<T>?
    var value: T?
    var description: String { return value.map { "\($0)" } ?? "nil" }
    
    init(_ value: T? = nil) {
        self.value = value
    }
}

class List<T>: CustomStringConvertible {
    var first: ListNode<T>?
    var last: ListNode<T>?
    var description: String {
        var string = "|"
        var next = first
        guard next != nil else { return string + "|" }
        
        while let current = next {
            if string.characters.count > 1 { string += ", " }
            string += current.description
            next = current.next
        }
        return string + "|"
    }
    
    init() {}
    
    init(array: [T]) {
        var previous: ListNode<T>?
        for item in array {
            let current = ListNode(item)
            if first == nil { first = current }
            previous?.next = current
            previous = current
        }
        last = previous
    }
    
    func add(item: T) {
        let node = ListNode(item)
        if first == nil { first = node }
        last?.next = node
        last = node
    }
    
    func rotate() {
        last = first
        var current = first
        var previous = current?.next
        current?.next = nil
        while previous != nil {
            let tmp = previous?.next
            previous?.next = current
            current = previous
            previous = tmp
        }
        first = current
    }
}

let list = List(array: [1, 2, 3, 4, 5])
list.rotate()
let emptyList = List<Int>()
emptyList.add(item: 1)
emptyList.add(item: 2)
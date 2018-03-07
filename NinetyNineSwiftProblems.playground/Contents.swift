//: http://www.enekoalonso.com/projects/99-swift-problems/

import UIKit

class List<T> {
    var value: T
    var next: List<T>?

    init(value: T) {
        self.value = value
    }

    init?(values: [T]) {
        guard let value = values.first else { return nil }

        self.value = value
        guard values.count > 1 else {
            return
        }

        var next = List(value: values[1])
        self.next = next
        for i in 2..<values.count {
            let value = values[i]
            let list = List(value: value)
            next.next = list
            next = list
        }
    }
}

extension List {
    var recursiveDescription: String {
        var result = "List(\(self.value)"
        var next = self.next
        while let list = next {
            result += ", "
            result += "\(list.value)"
            next = list.next
        }
        result += ")"
        return result
    }
}

let list = List(values: [1, 1, 2, 3, 5, 8])
list?.recursiveDescription

// P01

/*
 Example
 List(1, 1, 2, 3, 5, 8).last

 Result
 8
 */

extension List {
    var last: T? {
        guard var current = self.next else { return self.value }

        while let next = current.next {
            current = next
        }
        return current.value
    }
}

list?.last

// P02 (*) Find the last but one element of a linked list.
/*
 Example
 List(1, 1, 2, 3, 5, 8).pennultimate

 Result
 5
 */

extension List {
    var pennultimate: T? {
        guard var current = self.next else { return nil }

        var previous = self
        while let next = current.next {
            previous = current
            current = next
        }
        return previous.value
    }
}
list?.pennultimate

// P03 (*) Find the Kth element of a linked list.
/*
 Example
 let list = List(1, 1, 2, 3, 5, 8)
 list[2]

 Result
 2
 */

extension List {
    subscript(index: Int) -> T? {
        guard index != 0  else { return value }

        return next?[index - 1]
    }
}
list?[2]

// P04 (*) Find the number of elements of a linked list.
/*
 Example
 List(1, 1, 2, 3, 5, 8).length

 Result
 6
 */
extension List {
    var length: Int {
        var count = 1
        var current: List? = self
        while current?.next != nil {
            count += 1
            current = current?.next
        }
        return count
    }
}
list?.length

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

// P05 (*) Reverse a linked list.
/*
 Example
 List(1, 1, 2, 3, 5, 8).reverse()

 Result
 List(8, 5, 3, 2, 1, 1)
 */
extension List {
    func reverse() -> List {
        var current = self
        var next: List? = nil
        while let previous = current.next {
            current.next = next
            next = current
            current = previous
        }
        current.next = next
        return current
    }
}
let reversed = list?.reverse()
reversed?.recursiveDescription

// P06 (*) Find out whether a linked list is a palindrome.
/*
 Example
 List(1, 2, 3, 2, 1).isPalindrome()

 Result
 true
 */
extension List where T: Equatable {
    var values: [T] {
        var result: [T] = []
        var current = self
        while let next = current.next {
            result.append(current.value)
            current = next
        }
        result.append(current.value)
        return result
    }

    /// - Warning: Memory cost O(n)
    var isPalindrome: Bool {
        let values = self.values
        for idx in 0...length / 2 where values[idx] != values[values.count - 1 - idx] {
                return false
        }
        return true
    }

    /// - Warning: Complexity cost O(n^2)
    var isPalindrome2: Bool {
        let count = self.length
        for idx in 0...count / 2 {
            guard let left = self[idx], let right = self[count - 1 - idx], left == right else {
                return false
            }
        }
        return true
    }
}
let notPalindrome = List(values: [1, 3, 2, 2, 1])
notPalindrome?.isPalindrome
notPalindrome?.isPalindrome2
let palindrome = List(values: [1, 2, 3, 2, 1])
palindrome?.isPalindrome
palindrome?.isPalindrome2


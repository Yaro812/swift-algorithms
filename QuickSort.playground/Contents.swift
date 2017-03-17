//: Playground - noun: a place where people can play

import Foundation

extension Array where Element: Comparable {
    func quickSort() -> [Element] {
        guard count > 1 else { return self }
        
    let pivot = count / 2
        let value = self[pivot]
        let less = self.filter { $0 < value }
        let equal = self.filter { $0 == value }
        let more = self.filter { $0 > value }
        return less.quickSort() + equal + more.quickSort()
    }
}

let arr = [1,4,5,6,3,0,5,4,6,9,34,3,6,5,3,5,6,4,3,6,4,3,4,56,6,7,7,5,4,3]
let sorted = arr.quickSort()
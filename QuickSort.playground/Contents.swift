//: Playground - noun: a place where people can play

import Foundation

extension Array where Element: Comparable {
    func quickSort() -> [Element] {
    let pivot = count / 2
        let value = self[pivot]
        let less = self.sort { $0 < value }
        let equal = self.sort { $0 == value }
        let more = self.sort { $0 > value }
        return less.quickSort() + equal + more.quickSort()
    }
}
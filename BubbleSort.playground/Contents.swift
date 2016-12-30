//: Playground - noun: a place where people can play

import Foundation

extension Array where Element: Comparable {
    func bubbleSorted() -> [Element] {
        guard self.count > 1 else { return self }
        
        var result = self
        var sorted = false
        while !sorted {
            sorted = true
            for i in 1..<result.count {
                if result[i] < result[i-1] {
                    let tmp = result[i]
                    result[i] = result[i-1]
                    result[i-1] = tmp
                    sorted = false
                }
            }
        }
        return result
    }
}


let array = [2, 5, 4, 76, 43, 1, 12, 0, 1, 4, 7]
let sorted = array.bubbleSorted()
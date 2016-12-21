//: Playground - noun: a place where people can play

import Foundation

func mergeSort<T: Comparable>(_ a: [T]) -> [T] {
    guard a.count > 1 else { return a }
    
    let pivot = a.count / 2
    let less = mergeSort(Array(a[0..<pivot]))
    let more = mergeSort(Array(a[pivot..<a.count]))
    return merge(less, more)
}

func merge<T: Comparable>(_ less: [T], _ more: [T]) -> [T] {
    var less = less
    var more = more
    var result: [T] = []
    while !less.isEmpty && !more.isEmpty {
        if less[0] <= more[0] {
            result.append(less.remove(at: 0))
        } else {
            result.append(more.remove(at: 0))
        }
    }
    if !less.isEmpty { result.append(contentsOf: less) }
    if !more.isEmpty { result.append(contentsOf: more) }
    return result
}

let array = [1, 4, 0, 2, 3, 7, 4, 2, 8, 9]
let sorted = mergeSort(array)
//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func reverse(string: String) -> String {
    guard string.characters.count > 1 else { return string }
    
   let idx = string.index(string.startIndex, offsetBy: 1)
    return reverse(string: String(string[idx...])) + String(string[..<idx])
}

let reversed = reverse(string: str)

//: Playground - noun: a place where people can play

import UIKit

extension String {
    var compressed: String {
        var result = ""
        var repeats = 1
        for char in characters {
            if char == result.last {
                repeats += 1
            } else {
                if repeats > 1  {
                    result.append(String(repeats))
                }
                result.append(char)
                repeats = 1
            }
        }
        
         return result.count < count ? result : self
    }
}


let originalString = "aaaaabbbcdeeeeeeef"

originalString.compressed


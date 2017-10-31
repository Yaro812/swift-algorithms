//: Playground - noun: a place where people can play

import UIKit

func curried(x: Int) -> (String) throws -> Float {
    return {(y: String) -> Float in
        guard let y = Float(y) else { throw NSError() as Error }
        return Float(x) + y
    }
}

try? curried(x: 10)("5")

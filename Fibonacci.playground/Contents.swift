//:
//: [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89]

import Foundation

//: Simple recursive algorithm

func fib1(_ num: Int) -> Int {
    guard num > 2 else { return 1 }
    
    return fib1(num - 1) + fib1(num - 2)
}

fib1(4)
fib1(11)

//: Formula

func fib2(_ num: Int) -> Int {
    let sq5 = sqrt(5)
    let phi = (1 + sq5) / 2
    return Int(round(pow(phi, Double(num)) / sq5))
}

fib2(4)
fib2(11)

//: Iteration

func fib3(_ num: Int) -> Int {
    var x1 = 0
    var x2 = 1
    for _ in 1...num {
        x1 = x1 + x2
        x2 = x1 - x2
    }
    return x1
}

fib3(4)
fib3(11)


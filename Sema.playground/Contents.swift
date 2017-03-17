//: Playground - noun: a place where people can play

import UIKit

let queue1 = DispatchQueue(label: "queue1")
let queue2 = DispatchQueue(label: "queue2")

let sema1 = DispatchSemaphore(value: 0)
let sema2 = DispatchSemaphore(value: 0)

//: Rendez-vous problem solved

queue1.async {
    print("a1")
    sema1.signal()
    sema2.wait()
    print("a2")
}

queue2.async {
    print("b1")
    sema2.signal()
    sema1.wait()
    print("b2")
}

//: Mutex

let mutex = DispatchSemaphore(value: 1)
let queue3 = DispatchQueue(label: "queue3")
let queue4 = DispatchQueue(label: "queue4")
var source = "a"

queue3.async {
    mutex.wait()
    source += "b"
    mutex.signal()
}

queue4.async {
    mutex.wait()
    source += "c"
    mutex.signal()
}

mutex.wait()
print(source)

//: Barrier

let q = DispatchQueue(label: "q", attributes: .concurrent)
q.async(flags: .barrier) {
    Thread.sleep(forTimeInterval: 0.5)
    print("A")
}
q.sync {
    print("B")
}
print("C")


//: DeadLock

queue1.async {
    print("a3")
    sema2.wait()
    sema1.signal()
    print("never printed")
}

queue2.async {
    print("b3")
    sema1.wait()
    sema2.signal()
    print("never printed")
}

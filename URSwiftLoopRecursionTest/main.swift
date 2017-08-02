//
//  main.swift
//  URSwiftLoopRecursionTest
//
//  Created by DongSoo Lee on 2017. 8. 2..
//  Copyright © 2017년 URSwiftLoopRecursionTest. All rights reserved.
//

import Foundation

func loopStride(list: [Int]) -> [Int] {
    var temp = list
    for _ in stride(from: 0, to: list.count, by: 1) {
        temp.removeLast()
    }

    return temp
}

func loopSubscript(list: [Int]) -> [Int] {
    var temp = list
    for _ in list[0..<list.count] {
        temp.removeLast()
    }

    return temp
}

func loopWhile(list: [Int]) -> [Int] {
    var temp = list
    while temp.count > 0 {
        temp.removeLast()
    }

    return temp
}

func loopForEnumerated(list: [Int]) -> [Int] {
    var temp = list
    for (_, _) in temp.enumerated() {
        temp.removeLast()
    }

    return temp
}

func loopForIn(list: [Int]) -> [Int] {
    var temp = list
    for _ in temp {
        temp.removeLast()
    }

    return temp
}

func recurse(list: [Int]) -> [Int] {
    var temp = list
    if temp.count == 0 {
        return temp
    }

    temp.removeLast()
    return recurse(list: temp)
}

func recurse2(list: [Int]) -> [Int] {
    return recurse(list: list)
}

func tailRecurse2(list: [Int]) -> [Int] {
    return tailRecurse(list: list, mid: nil)
}

func tailRecurse(list: [Int], mid: [Int]?) -> [Int] {
    var temp = list
    if let m = mid {
        if m.count != 0 {
            temp = m
        } else {
            return m
        }
    }
    if temp.count == 0 {
        return temp
    }

    temp.removeLast()
    return tailRecurse(list: list, mid: temp)
}

// 꼬리 재귀
func tailfactorial(x: Int, fac: Int) -> Int {
    if x == 1 {
        return fac
    }
    return tailfactorial(x: x-1, fac: x * fac)
}

// 일반적인 재귀
func recfactorial(x: Int) -> Int {
    if x == 1 {
        return 1
    }
    return x * recfactorial(x: x-1)
}

// 꼬리 재귀
func tailSum(x: Int, fac: Int) -> Int {
    if x == 1 {
        return fac
    }
    return tailSum(x: x-1, fac: x + fac)
}

// 일반적인 재귀
func recSum(x: Int) -> Int {
    if x == 1 {
        return 1
    }
    return x + recSum(x: x-1)
}

print("", pow(2, 16))
print(Double(Int64(NSEC_PER_SEC)) / Double(NSEC_PER_SEC))

var list: [Int] = Array<Int>(repeating: 5, count: 10000)

var bef = Date().timeIntervalSince1970
var r = 0

sleep(1)
bef = Date().timeIntervalSince1970
print("start is ", 0, "by tailSum")
r = tailSum(x: 87327, fac: 1)
print("end is ", r, ", ", (Date().timeIntervalSince1970 - bef) * 1000)

print()

sleep(1)
bef = Date().timeIntervalSince1970
print("start is ", 0, "by recSum")
r = recSum(x: 104793)
print("end is ", r, ", ", (Date().timeIntervalSince1970 - bef) * 1000)

print()

sleep(1)
bef = Date().timeIntervalSince1970
print("start is ", 0, "by tailfactorial")
r = tailfactorial(x: 10, fac: 1)
print("end is ", r, ", ", (Date().timeIntervalSince1970 - bef) * 1000)

print()

sleep(1)
bef = Date().timeIntervalSince1970
print("start is ", 0, "by recfactorial")
r = recfactorial(x: 10)
print("end is ", r, ", ", (Date().timeIntervalSince1970 - bef) * 1000)

print()

sleep(1)
bef = Date().timeIntervalSince1970
print("start is ", 0, "by recurse2")
_ = recurse2(list: list)
print("end is ", Date().timeIntervalSince1970 - bef)

print()

sleep(1)
bef = Date().timeIntervalSince1970
print("start is ", 0, "by tailRecurse")
_ = tailRecurse(list: list, mid: nil)
print("end is ", Date().timeIntervalSince1970 - bef)

print()

sleep(1)
bef = Date().timeIntervalSince1970
print("start is ", 0, "by tailRecurse2")
_ = tailRecurse2(list: list)
print("end is ", Date().timeIntervalSince1970 - bef)

print()

sleep(1)
bef = Date().timeIntervalSince1970
print("start is ", 0, "by while")
_ = loopWhile(list: list)
print("end is ", Date().timeIntervalSince1970 - bef)

print()

sleep(1)
bef = Date().timeIntervalSince1970
print("start is ", 0, "by for-in")
_ = loopForIn(list: list)
print("end is ", Date().timeIntervalSince1970 - bef)

print()

sleep(1)
bef = Date().timeIntervalSince1970
print("start is ", 0, "by stride")
_ = loopStride(list: list)
print("end is ", Date().timeIntervalSince1970 - bef)

print()

sleep(1)
bef = Date().timeIntervalSince1970
print("start is ", 0, "by subscript")
_ = loopSubscript(list: list)
print("end is ", Date().timeIntervalSince1970 - bef)

print()

sleep(1)
bef = Date().timeIntervalSince1970
print("start is ", 0, "by for enumerated")
_ = loopForEnumerated(list: list)
print("end is ", Date().timeIntervalSince1970 - bef)

print()

sleep(1)
bef = Date().timeIntervalSince1970
print("start is ", 0, "by recurse")
_ = recurse(list: list)
print("end is ", Date().timeIntervalSince1970 - bef)

print()

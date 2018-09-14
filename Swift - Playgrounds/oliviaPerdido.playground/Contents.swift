//: Playground - noun: a place where people can play

import Foundation

var teste = 1...10 ~= 11

print(teste)

extension Comparable {
    static func ~=(lhs:Self, rhs:ClosedRange<Self>) -> Bool {
        return rhs ~= lhs
    }
}

var teste2 = 6 ~= 1...10

print(teste2)
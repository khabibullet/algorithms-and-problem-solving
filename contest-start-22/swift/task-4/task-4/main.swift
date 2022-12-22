//
//  main.swift
//  task-4
//
//  Created by Ирек Хабибуллин on 14.12.2022.
//

import Foundation

func getHordLen(n: Int, k: Int) -> Double {
    return sin(Double.pi * Double(k) / Double(n)) / b
}

func heronArea(a: Double, b: Double, c: Double) -> Double {
    let p = (a + b + c) / 2
    return sqrt(p * (p - a) * (p - b) * (p - c))
}

func upperBound(n: Int) -> Int {
    return n / 2 + 1
}

func lowerBound(n: Int) -> Int {
    if n % 3 == 0 {
        return n / 3
    } else {
        return n / 3 + 1
    }
}

func getSubArea(sides: Int) -> Double {
    if sides - 2 < 2 {
        return 0.0
    }
    let max = sides - 2
    let min = max / 2
    let mid = max - min
    return getTotalArea(min: min, mid: mid, max: max, calculateMaxSubArea: false)
}

func getTotalArea(min: Int, mid: Int, max: Int, calculateMaxSubArea: Bool) -> Double {
    var area = heronArea(a: h[min], b: h[mid], c: h[max])
    area += getSubArea(sides: min)
    area += getSubArea(sides: mid)
    if calculateMaxSubArea == true {
        area += getSubArea(sides: max)
    }
    return area
}

let n = Int(readLine()!)!

let b = sin(Double.pi / Double(n))

let h = (0...(n - 1)).map { getHordLen(n: n, k: $0) }

let low = lowerBound(n: n)
let up = upperBound(n: n)

var maxArea = Double(0)
for maxSides in low...up {
    let minSides = (n - maxSides) / 2
    let midSides = n - maxSides - minSides
    let totalArea = getTotalArea(min: minSides, mid: midSides,
        max: maxSides, calculateMaxSubArea: true)
    if totalArea > maxArea {
        maxArea = totalArea
    }
}

print(String(format: "%.6f", maxArea))

//
//  main.swift
//  colorful-roads-country
//
//  Created by Alebelly Nemesis on 10/30/22.
//

import Foundation

struct Town {
    let id: Int
    var g: [Int] = []
    var y: [Int] = []
    var r: [Int] = []
    
    init(id: Int) {
        self.id = id
    }
}

let strArr = readLine()!.split(separator: " ")

let townsCount = Int(strArr[0])!

var towns: [Town] = {
    var towns: [Town] = []
    for i in 1...townsCount {
        towns.append(Town(id: i))
    }
    return towns
}()

let roadsCount = Int(strArr[1])!

for _ in 1...roadsCount {
    let strArr = readLine()!.split(separator: " ")
    
    switch String(strArr[2]) {
    case "g":
        towns[Int(strArr[0])! &- 1].g.append(Int(strArr[1])!)
    case "y":
        towns[Int(strArr[0])! &- 1].y.append(Int(strArr[1])!)
    case "r":
        towns[Int(strArr[0])! &- 1].r.append(Int(strArr[1])!)
    default:
        break
    }
}

let questionsCount = Int(readLine()!)!

for _ in 1...questionsCount {
    let arr = readLine()!.split(separator: " ")
    let start = Int(arr[0])!
    let end = Int(arr[1])!
    var count = 0

    for greenId in towns[start - 1].g {
        for yellowId in towns[greenId - 1].y {
            for redId in towns[yellowId - 1].r {
                if redId == end { count &+= 1 }
            }
        }
    }
    print(count)
}

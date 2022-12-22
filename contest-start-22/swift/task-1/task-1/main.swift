//
//  main.swift
//  task-1
//
//  Created by Ирек Хабибуллин on 14.12.2022.
//

_ = readLine()
let words = readLine()!.split(separator: " ").map { Array<Character>(String($0)) }
let colors = Array<Character>(readLine()!)

var count = 0
var firstColorID = 0

for word in words {
    if word.count < 2 {
        if firstColorID < colors.count - 1 {
            firstColorID += 1
        }
        continue
    }
    for id in firstColorID...firstColorID + word.count - 2 {
        if colors[id] == colors[id + 1] {
            count += 1
            break
        }
    }
    firstColorID += word.count
}

print(count)

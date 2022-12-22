//
//  main.swift
//  task-2
//
//  Created by Ирек Хабибуллин on 14.12.2022.
//

func count(sum: Int, step: Int) -> Int {
    switch sum {
    case ..<0: return 0
    case 0: return 1
    default:
        var child = count(sum: sum - c, step: 2)
        if step <= 0 {
            child += count(sum: sum - a, step: 0)
        }
        if step <= 1 {
            child += count(sum: sum - b, step: 1)
        }
        return child
    }
}

let weights = readLine()!.split(separator: " ").map { Int($0)! }
let values = readLine()!.split(separator: " ").map { Int($0)! }

let (a, b, c) = (weights[0], weights[1], weights[2])
let (x, y, z) = (values[0], values[1], values[2])

let sum = x * a + y * b + z * c

print(count(sum: sum, step: 0))



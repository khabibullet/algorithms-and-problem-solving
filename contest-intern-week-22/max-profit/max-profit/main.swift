//
//  main.swift
//  max-profit
//
//  Created by Ирек Хабибуллин on 14.10.2022.
//

var customers: [(cost: Int, weeks: Int)] = []

let inputs = readLine()?.split(separator: " ")

let billboardsCount: Int = Int(inputs![0])!
let maxWeeks: Int = Int(inputs![2])!

var totalWeeksLeft = billboardsCount * maxWeeks

while let line = readLine() {
    let pair = line.split(separator: " ").map { Int($0) }
    customers.append((pair[0]!, pair[1]!))
}

customers.sort(by: { $0.cost > $1.cost } )

var totalProfit: Int = 0

for customer in customers {
    if totalWeeksLeft - customer.weeks < 0 {
        totalProfit += totalWeeksLeft * customer.cost
        break
    } else {
        totalProfit += customer.weeks * customer.cost
        totalWeeksLeft -= customer.weeks
    }
}

print(totalProfit)


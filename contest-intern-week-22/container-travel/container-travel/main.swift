//
//  main.swift
//  container-travel
//
//  Created by Alebelly Nemesis on 10/15/22.
//

guard let string = readLine() else { fatalError("Bad input") }
guard let itemsCount = Int(string) else { fatalError("Bad input") }

var maxDimensions = [Int]()

while let line = readLine() {
    let item = line.split(separator: " ")
    let last = item.count - 1
    let dimensions: [Int] = item[(last-2)...last].map { Int($0)! }
    maxDimensions.append(dimensions.max()!)
}

maxDimensions.sort(by: { $0 < $1 })
print(maxDimensions)

print(maxDimensions[(maxDimensions.count - 1) / 2])

//
//  main.swift
//  task-6
//
//  Created by Ирек Хабибуллин on 15.12.2022.
//

var mySet = Set<Int>()

let q = Int(readLine()!)!
var maxXOR = 0

for _ in 0...(q - 1) {
    let k = Int(readLine()!)!

    for elem in mySet {
        let xor = elem ^ k
        if xor > maxXOR {
            maxXOR = xor
        }
    }
    mySet.update(with: k)
    print(maxXOR)
}

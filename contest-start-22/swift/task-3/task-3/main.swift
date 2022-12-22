//
//  main.swift
//  task-3
//
//  Created by Ирек Хабибуллин on 14.12.2022.
//

func getPair(from n: Int) -> (Int, Int) {
    if n % 2 == 0 {
        return (n / 2, n / 2)
    }
    
    var i = 3
    while i <= n {
        if n % i == 0 {
            let a = n / i
            let b = n - a
            return (a, b)
        }
        i += 2
    }
    return (0, 0)
}

let n = Int(readLine()!)!

let (a, b) = getPair(from: n)

print(a, b)

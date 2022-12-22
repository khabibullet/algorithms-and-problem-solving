//
//  main.swift
//  sightseeings
//
//  Created by Alebelly Nemesis on 10/16/22.
//

extension Array where Element == Int {
    mutating func merge(with array: [Int]) {
        for i in 0...self.endIndex - 1 {
            let sublen = self.count - i
            
            if array.count >= sublen {
                if self[i...] == array[0...sublen - 1] {
                    self.append(contentsOf: array[sublen...])
                    return
                }
            } else if self[i...(i + array.count - 1)] == array[...] {
                return
            }
        }
        self.append(contentsOf: array)
        return
    }
}

guard let str1 = readLine() else { fatalError("Bad input") }

let seq1 = str1.split(separator: " ")[1...].map { (sub: Substring) -> Int in
    guard let num = Int(sub) else { fatalError("Bad input") }
    return num
}

guard let str2 = readLine() else { fatalError("Bad input") }

let seq2 = str2.split(separator: " ")[1...].map { (sub: Substring) -> Int in
    guard let num = Int(sub) else { fatalError("Bad input") }
    return num
}

guard let str3 = readLine() else { fatalError("Bad input") }

let seq3 = str3.split(separator: " ")[1...].map { (sub: Substring) -> Int in
    guard let num = Int(sub) else { fatalError("Bad input") }
    return num
}



var superseqs: [[Int]] = [seq1, seq1, seq2, seq2, seq3, seq3]

superseqs[0].merge(with: seq2)
superseqs[0].merge(with: seq3)
superseqs[1].merge(with: seq3)
superseqs[1].merge(with: seq2)
superseqs[2].merge(with: seq1)
superseqs[2].merge(with: seq3)
superseqs[3].merge(with: seq3)
superseqs[3].merge(with: seq1)
superseqs[4].merge(with: seq1)
superseqs[4].merge(with: seq2)
superseqs[5].merge(with: seq2)
superseqs[5].merge(with: seq1)



superseqs.sort(by: { $0.count < $1.count } )

print(superseqs[0].count)
print(superseqs[0].map { String($0) }.joined(separator: " "))

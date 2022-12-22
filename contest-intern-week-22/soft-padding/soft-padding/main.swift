//
//  main.swift
//  soft-padding
//
//  Created by Alebelly Nemesis on 10/14/22.
//

guard let input = readLine()?.split(separator: " ") else { fatalError("Bad input") }

guard let bandHeight = Int(input[0]) else { fatalError("Bad input") }

guard let padsStrArr = readLine()?.split(separator: " ") else { fatalError("Bad input") }

var pads = padsStrArr.map { (sub: Substring) -> Int in
    guard let padLength = Int(sub) else { fatalError("Bad input") }
    return padLength
}

while pads.count > bandHeight {
    var (minIndex, minElement) = (0, pads[0])
    for (index, element) in pads.enumerated() {
        if element < minElement {
            (minIndex, minElement) = (index, element)
        }
    }
    
    switch minIndex {
    case pads.startIndex:
        pads[minIndex] += pads.remove(at: minIndex + 1)
    case pads.endIndex:
        pads[minIndex] += pads.remove(at: minIndex - 1)
    default:
        if pads[minIndex - 1] < pads[minIndex + 1] {
            pads[minIndex - 1] += pads.remove(at: minIndex - 1)
        } else {
            pads[minIndex] += pads.remove(at: minIndex + 1)
        }
    }
}

print(pads.min()!)

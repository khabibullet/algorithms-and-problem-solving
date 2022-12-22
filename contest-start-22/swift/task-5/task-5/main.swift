//
//  main.swift
//  task-5
//
//  Created by Ирек Хабибуллин on 14.12.2022.
//

func getShortestPath(from id: Int, flights: [Dictionary<Int, Int>]) -> (Int?, Int?) {
    if flights[id].isEmpty {
        return (nil, nil)
    }
    if let parityToFinalDest = flights[id][n] {
        return (1, parityToFinalDest)
    }
    var (shortest, parity): (Int?, Int?) = (nil, nil)
    
    for (destination, _) in flights[id] {
        guard let (length, _) = getShortestPath(from: destination - 1, flights: flights)
            as? (Int, Int) else { continue }
        
        if let shortest = shortest, length >= shortest {
            continue
        }
        (shortest, parity) = (length, flights[id][destination])
    }
    guard let shortest = shortest, let parity = parity else {
        return (nil, nil)
    }
    return (shortest + 1, parity)
}

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (input[0], input[1])

var flights = [Dictionary<Int, Int>](repeating: [:], count: n)

if m > 0 {
    for _ in 0...(m - 1) {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        let (departID, destID, parity) = (input[0], input[1], input[2])
        
        let oldParity = flights[departID - 1][destID]
        guard let oldParity = oldParity else {
            flights[departID - 1][destID] = parity
            continue
        }
        if oldParity != parity {
            flights[departID - 1][destID] = -1
        }
    }
}

print("flights: ", flights)

var airportParities: [Int] = []


for id in 0...(flights.count - 1) {
    if let (_, parity) = getShortestPath(from: id, flights: flights)
        as? (Int, Int) {
        if parity == 1 {
            airportParities.append(0)
        } else {
            airportParities.append(1)
        }
    } else {
        airportParities.append(1)
    }
}

print("parities: ", airportParities)

var availableFlights = [Dictionary<Int, Int>](repeating: [:], count: n)

for id in 0...(flights.count - 1) {
    for (dest, _) in flights[id] {
        if flights[id][dest] == -1 ||
            flights[id][dest] == airportParities[id] {
            availableFlights[id][dest] = airportParities[id]
        }
    }
}

print("available", availableFlights)

if let (newShortest, _) = getShortestPath(from: 0, flights: availableFlights)
    as? (Int, Int) {
    print(newShortest)
} else if n == 1{
    print(0)
} else {
    print(-1)
}

print(airportParities.map({ String($0) }).joined(separator: ""))

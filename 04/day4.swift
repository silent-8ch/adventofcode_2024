import UIKit
let fileUrl = Bundle.main.url(forResource: "input_day4", withExtension: "txt")
let inputString = try String(contentsOf: fileUrl!, encoding: String.Encoding.utf8)
let target : Array<Character> = ["X", "M", "A", "S"]
var directions = ["NW": (x: -1, y: -1),
                  "N": (x: 0, y: -1),
                  "NE": (x: 1, y: -1),
                  "W": (x: -1, y: 0),
                  "E": (x: 1, y: 0),
                  "SW": (x: -1, y: 1),
                  "S": (x: 0, y: 1),
                  "SE": (x: 1, y: 1),
]

var words = [[Character]]()
words.append([])
var column = 0
var row = 0
let size = 140

for curr in inputString {
    if curr.isNewline {
        row += 1
        column = 0
        words.append([])
    } else {
        words[row].append(curr)
    }
}

var xmasCount = 0

for rowIterator in 0...size - 1{
    var rowString = ""
    for colIterator in 0...size - 1{
        rowString += String(words[rowIterator][colIterator])
        startSearch(x: rowIterator, y: colIterator)
    }
    print("\(rowString)")
}

@MainActor func startSearch(x: Int, y: Int) {
    if words[x][y] == target[0] {
        spreadOut(x: x, y: y)
    }
}

@MainActor func spreadOut(x: Int, y: Int) {
    for direction in directions {
        search(x: x, y: y, direction: direction.value, index: 1)
    }
    
}

@MainActor func search(x: Int, y: Int, direction: (x: Int, y: Int), index: Int) {
    guard x + direction.x>=0 && x + direction.x < size && (y + direction.y) >= 0 && (y + direction.y) < size else {
        return
    }
    do {
        let next = words[x + direction.x][ y + direction.y]
        if (next == target[index] && index < 3) {
            search(x: x + direction.x, y: y + direction.y, direction: direction, index: index+1)
        } else if (next == target[index] && index == 3) {
            xmasCount += 1
        }
    }
}
print(xmasCount)

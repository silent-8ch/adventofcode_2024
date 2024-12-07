import UIKit

let fileURL = Bundle.main.url(forResource: "inputday6", withExtension: "txt")
let inputString = try String(contentsOf: fileURL! ,encoding: String.Encoding.utf8)
var maze = [[Character]]()
maze.append([Character]())
var row = 0
var col = 0
var count = 0
var location = (x:0, y:0)
var directions = [
                  "N": (x: -1, y: 0),
                  "W": (x: 0, y: 1),
                  "E": (x: 0, y: -1),
                  "S": (x: 1, y: 0),
]
var direction = "N"

for curr in inputString {
    if curr.isNewline {
        maze.append([Character]())
        row += 1
        col = 0
    } else {
        if (curr == "^") {
//            print("found you at \(row), \(col)")
            location = (x: row, y: col)
            count += 1
            maze[row].append("X")
        } else {
            maze[row].append(curr)
        }
        col += 1
    }
}
maze.removeLast()
var limiter = 10000
var limit = 0
while (location.x >= 0 && location.x < maze[0].count && location.y >= 0 && location.y < maze.count) {
    if (maze[location.x][location.y] == ".") {
        count += 1
        maze[location.x][location.y] = "X"
    }
    if (shouldTurnRight()) {
        turnRight()
    } else {
        location.x += directions[direction]!.x
        location.y += directions[direction]!.y
    }
    limit += 1
    if (limit == limiter) {
        maze[location.x][location.y] = "P"
        break
    }
}
var secondCount = 0
for i in 0...maze.count-1 {
    var rowString = ""
    for j in 0...maze[i].count-1 {
        rowString += String(maze[i][j])
        if maze[i][j] == "X" {
            secondCount += 1
        }
    }
    print(rowString)
}

@MainActor func turnRight() {
    switch (direction) {
    case "N": direction = "W"
    case "E": direction = "N"
    case "S": direction = "E"
    default: direction = "S"
    }
}

@MainActor func shouldTurnRight() -> Bool {
    let next = (x: location.x + (directions[direction]!.x), y: location.y + (directions[direction]!.y))
    print(location.x, location.y, next.x, next.y, direction, maze.count)
    if (next.x < 0 || next.x >= maze[0].count || next.y < 0 || next.y >= maze.count) {
        return false
    } else if (maze[next.x][next.y] == "#") {
        return true
    } else {
        return false
    }
}
print(count)
print(secondCount)

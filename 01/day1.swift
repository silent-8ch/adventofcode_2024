import UIKit
let fileURL = Bundle.main.url(forResource: "input day 1", withExtension: "txt")
let inputString = try String(contentsOf: fileURL! ,encoding: String.Encoding.utf8)

var list1 = [Int]()
var list2 = [Int]()
var tempString = ""
var rowTimer = 0
for curr in inputString {
    if curr.isNewline {
        rowTimer = 0
        continue
    }
    switch rowTimer {
    case 0:
        tempString = ""
        tempString = tempString + String(curr)
    case 1:
        tempString = tempString + String(curr)
    case 2:
        tempString = tempString + String(curr)
    case 3:
        tempString = tempString + String(curr)
    case 4:
        tempString = tempString + String(curr)
        list1.append(Int(tempString)!)
    case 5:
        print("")
    case 6:
        print("")
    case 7:
        print("")
    case 8:
        tempString = ""
        tempString = tempString + String(curr)
    case 9:
        tempString = tempString + String(curr)
    case 10:
        tempString = tempString + String(curr)
    case 11:
        tempString = tempString + String(curr)
    case 12:
        tempString = tempString + String(curr)
        list2.append(Int(tempString)!)
    default:print("")
    }
    rowTimer = rowTimer + 1
}
list1.sort()
list2.sort()

var diff = 0
for loop in 0...list1.count - 1{
    let a = list1[loop]
    let b = list2[loop]
    if (a > b) {
        diff = diff + (a - b)
    } else {
        diff = diff + (b - a)
    }
}
print(diff)

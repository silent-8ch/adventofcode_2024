import UIKit

let fileUrl = Bundle.main.url(forResource: "day_3_input", withExtension: "txt")

let inputString = try String(contentsOf: fileUrl!, encoding: String.Encoding.utf8)
enum Stages {
    case finding_m
    case finding_u
    case finding_l
    case finding_left_paren
    case finding_x
    case finding_comma
    case finding_right_paren
    case finding_y
}
let numbers : Array<Character> = ["0","1","2","3","4","5","6","7","8","9"]

var currentStage = Stages.finding_m

var integerString = ""
var x: Int = 1
var y: Int = 1
var answer = 0

for curr in inputString {
    switch(currentStage)
    {
    case .finding_m:
        if (curr == "m") {
            currentStage = .finding_u
        } else {
            currentStage = .finding_m
        }
    case .finding_u:
        if (curr == "u") {
            currentStage = .finding_l
        } else {
            currentStage = .finding_m
        }
    case .finding_l:
        if (curr == "l") {
            currentStage = .finding_left_paren
        } else {
            currentStage = .finding_m
        }
    case .finding_left_paren:
        if (curr == "(") {
            
            currentStage = .finding_x
            integerString = ""
        } else {
            currentStage = .finding_m
        }
    case .finding_x:
        if (numbers.contains(curr)) {
            integerString += String(curr)
        } else if (curr == ",") {
            x = Int(integerString)!
            integerString = ""
            currentStage = .finding_y
        } else{
            currentStage = .finding_m
        }
    case .finding_y:
        if (numbers.contains(curr)) {
            integerString += String(curr)
        } else if (curr == ")") {
            y = Int(integerString)!
            integerString = ""
            currentStage = .finding_m
            print("found mul(\(x),\(y))")
            answer += x * y
        } else{
            currentStage = .finding_m
        }
    default:continue
    }

}

print(answer)

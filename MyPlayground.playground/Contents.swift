import UIKit

var greeting = 14

var deals = greeting % 7

var noOfDays = 38
var daysInMonthAll = [Int: [String]]()
var daysArray: [String] = []
var dictionaryIndex = 0
var value = (noOfDays / 7) + 1
//print(value)

var myArray = [3,23,2,3,3,4,5,22,3,4,3,43,24,664,6,43,3,224,5]

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}

let mData = myArray.chunked(into: 7)
print(mData)


//(0...noOfDays).forEach { index in
//    var percentile = index % 7
//    if percentile == 0 && index != 0 {
//        daysInMonthAll[dictionaryIndex] = daysArray
//        dictionaryIndex = dictionaryIndex + 1
//        daysArray = [String]()
//    }
//   // print(percentile)
//    daysArray.append("redd \(index)")
//}

//print(daysInMonthAll)

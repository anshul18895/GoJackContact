import UIKit

var str = "Hello, playground"

extension Array {
    func group<U: Hashable>(by key: (Element) -> U) -> [[Element]] {
        //keeps track of what the integer index is per group item
        var indexKeys = [U : Int]()
        
        var grouped = [[Element]]()
        for element in self {
            let key = key(element)
            
            if let ind = indexKeys[key] {
                grouped[ind].append(element)
            }
            else {
                grouped.append([element])
                indexKeys[key] = grouped.count - 1
            }
        }
        return grouped
    }
}

var arrInt: [Int] = [5, 23 ,23 , 66 , 5 ,23 , 7 , 0]
func getFirstTwoItemsWithoutPair(list: [Int]) -> [Int] {
    let _list : list.group(by: {$0}).filter({$0.count == 1}).map({$0.first!})
    var arrInt: [Int] = []
    if let first = _list.first {
        arrInt.append(first)
        arrInt.removeFirst()
    }
    if let first = _list.first {
        arrInt.append(first)
    }
    return arrInt
}


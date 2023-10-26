import UIKit

// Given an array of non-empty String values, remove all the strings that start with a vowel (a, e, i, o, u), regardless of case, and sort the remaining strings, again regardless of case, by descending alphabetical order (z to a).

// Return whatever is left in the filtered and sorted array.

// - Example 1:
//
// Given array: ["Alan", "Timothy", "Kevin", "Ethan", "Matthew"]
//
// Filtered array: ["Timothy", "Kevin", "Matthew"]
//
// Sorted array (final result): ["Timothy", "Matthew", "Kevin"]

// - Example 2:
//
// Given array: ["lion", "tiger", "bear", "eagle", "Big Bird", "raccoon", "skunk", "Toothless", "aardvark", "baboon", "Old Yeller"]
//
// Filtered array: ["lion", "tiger", "bear", "Big Bird", "raccoon", "skunk", "Toothless", "baboon"]
//
// Sorted array (final result): ["Toothless", "tiger", "skunk", "raccoon", "lion", "Big Bird", "bear", "baboon"]

func validateStringFirstElement(string: String) -> [String] {
    var tempList: [String] = []
    
    if let firstChar = string.first,
       firstChar.lowercased() != "a",
       firstChar.lowercased() != "e",
       firstChar.lowercased() != "i",
       firstChar.lowercased() != "o",
       firstChar.lowercased() != "u" {
        tempList.append(string)
    }
    
    return tempList
}

func sortAndFilter(_ stringArray: [String]) -> [String] {
    var list: [String] = []
    stringArray.forEach { string in
        list.append(contentsOf: validateStringFirstElement(string: string))
    }
    
    let sortedList = list.sorted { (lhs: String, rhs: String) -> Bool in
        return lhs.caseInsensitiveCompare(rhs) == .orderedDescending
    }
    
    return sortedList //list.sorted(by: { $0 > $1 } ) // does not work because of case insensitiveCompare
}


sortAndFilter(["Alan", "Timothy", "Kevin", "Ethan", "Matthew"])

sortAndFilter(["lion", "tiger", "bear", "eagle", "Big Bird", "raccoon", "skunk", "Toothless", "aardvark", "baboon", "Old Yeller"])

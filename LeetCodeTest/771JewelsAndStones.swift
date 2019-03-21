//
//  771JewelsAndStones.swift
//  LeetCodeTest
//
//  Created by Di on 2019/3/21.
//  Copyright © 2019 chouheiwa. All rights reserved.
//

import Foundation



class Solution771 {
    func numJewelsInStones(_ J: String, _ S: String) -> Int {
        var myJ: [Int8: Int] = [:]

        let jArray = J.utf8CString

        for item in jArray {
            myJ[item] = 0
        }

        myJ[0] = nil

        let sArray = S.utf8CString

        for item in sArray {
            if var length = myJ[item] {
                length += 1
                myJ[item] = length
            }
        }

        var result = 0

        for item in myJ.values {
            result += item
        }

        return result
    }
}

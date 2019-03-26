//
//  171excel-sheet-column-number.swift
//  LeetCodeTest
//
//  Created by Di on 2019/3/25.
//  Copyright © 2019 chouheiwa. All rights reserved.
//

import Foundation
/**
 给定一个Excel表格中的列名称，返回其相应的列序号。

 例如，

 A -> 1
 B -> 2
 C -> 3
 ...
 Z -> 26
 AA -> 27
 AB -> 28
 ...
 https://leetcode-cn.com/problems/excel-sheet-column-number/
 */
class Solution171 {
    func titleToNumber(_ s: String) -> Int {
        let array = s.unicodeScalars

        var result: UInt32 = 0

        let A: UInt32 = 65

        for item in array {
            result *= 26

            result += item.value - A + 1
        }

        return Int(result)
    }
}

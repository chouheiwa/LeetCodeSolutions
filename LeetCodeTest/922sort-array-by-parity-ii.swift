//
//  922sort-array-by-parity-ii.swift
//  LeetCodeTest
//
//  Created by Di on 2019/3/22.
//  Copyright © 2019 chouheiwa. All rights reserved.
//

import Foundation
/**
 给定一个非负整数数组 A， A 中一半整数是奇数，一半整数是偶数。

 对数组进行排序，以便当 A[i] 为奇数时，i 也是奇数；当 A[i] 为偶数时， i 也是偶数。

 你可以返回任何满足上述条件的数组作为答案。
 https://leetcode-cn.com/problems/sort-array-by-parity-ii/
 */
class Solution922 {
    func sortArrayByParityII(_ A: [Int]) -> [Int] {
        var A = A

        var single = 0
        var double = 1

        while single < A.count && double < A.count {
            if A[single] & 1 == 0 {
                single += 2
                continue
            }

            if A[double] & 1 == 1 {
                double += 2
                continue
            }

            let temp = A[single]
            A[single] = A[double]
            A[double] = temp

            single += 2
            double += 2
        }
        return A
    }
}

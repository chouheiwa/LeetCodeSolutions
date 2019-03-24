//
//  561array-partition-i.swift
//  LeetCodeTest
//
//  Created by Di on 2019/3/24.
//  Copyright © 2019 chouheiwa. All rights reserved.
//

import Foundation

/**
 给定长度为 2n 的数组, 你的任务是将这些数分成 n 对, 例如 (a1, b1), (a2, b2), ..., (an, bn) ，使得从1 到 n 的 min(ai, bi) 总和最大。

 示例 1:

 输入: [1,4,3,2]

 输出: 4
 解释: n 等于 2, 最大总和为 4 = min(1, 2) + min(3, 4).
 提示:

 n 是正整数,范围在 [1, 10000].
 数组中的元素范围在 [-10000, 10000].

 https://leetcode-cn.com/problems/array-partition-i/
*/
class Solution561 {
    func arrayPairSum(_ nums: [Int]) -> Int {
        var nums = nums

        nums.sort()

        var result = 0

        for (index, item) in nums.enumerated() where index % 2 == 0 {
            result += item
        }

        return result
    }
}

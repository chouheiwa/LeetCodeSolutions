//
//  78subsets.swift
//  LeetCodeTest
//
//  Created by Di on 2019/3/26.
//  Copyright © 2019 chouheiwa. All rights reserved.
//

import Foundation
/**
 给定一组不含重复元素的整数数组 nums，返回该数组所有可能的子集（幂集）。

 说明：解集不能包含重复的子集。

 示例:

 输入: nums = [1,2,3]
 输出:
 [
 [3],
 [1],
 [2],
 [1,2,3],
 [1,3],
 [2,3],
 [1,2],
 []
 ]

 https://leetcode-cn.com/problems/subsets/
 */
class Solution78 {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var results: [[Int]] = [[]]

        for num in nums {
            for reuslt in results {
                results.append(reuslt + [num])
            }
        }

        return results
    }
}

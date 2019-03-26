//
//  46permutations.swift
//  LeetCodeTest
//
//  Created by Di on 2019/3/26.
//  Copyright © 2019 chouheiwa. All rights reserved.
//

import Foundation

/**
 给定一个没有重复数字的序列，返回其所有可能的全排列。

 示例:

 输入: [1,2,3]
 输出:
 [
 [1,2,3],
 [1,3,2],
 [2,1,3],
 [2,3,1],
 [3,1,2],
 [3,2,1]
 ]

 https://leetcode-cn.com/problems/permutations/
 */
class Solution46 {
    func permute(_ nums: [Int]) -> [[Int]] {
        var results: [[Int]] = []

        solution(nums, start: 0, results: &results)

        return results
    }

    private func solution(_ nums: [Int], start: Int, results: inout [[Int]]) {
        if start == nums.count {
            results.append(nums)
        }

        for index in start..<nums.count {
            var nums = nums

            if nums[start] == nums[index] && start != index {
                continue
            }
            let temp = nums[index]
            nums[index] = nums[start]
            nums[start] = temp

            solution(nums, start: start + 1, results: &results)
        }
    }
}

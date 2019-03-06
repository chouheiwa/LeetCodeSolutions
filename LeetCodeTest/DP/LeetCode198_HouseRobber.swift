//
//  LeetCode198_HouseRobber.swift
//  LeetCodeTest
//
//  Created by Di on 2019/2/27.
//  Copyright © 2019 chouheiwa. All rights reserved.
//

import Foundation

/// 问题:
/// 你是一个小偷，计划去偷一个街区上的房子，每所房子可以偷取到一定价值的财物。你不能偷取相邻的房子的财物，那样会触发警报。给出最大的偷盗金额
/// 给出一个数组，数组中包含的数字为价值，不能选取相邻的数字，给出可能的最大值

/// You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed, the only constraint stopping you from robbing each of them is that adjacent houses have security system connected and it will automatically contact the police if two adjacent houses were broken into on the same night.

/// Given a list of non-negative integers representing the amount of money of each house, determine the maximum amount of money you can rob tonight without alerting the police.

/// 递归调用
class Solution198 {
    func rob(_ nums: [Int]) -> Int {
        return rob(nums, index: 0)
    }

    private func rob(_ nums: [Int], index: Int) -> Int {
        var biggest = 0

        for indexI in index..<nums.count {
            var temp = 0

            if indexI + 2 < nums.count {
                temp = nums[indexI] + rob(nums, index: indexI + 2)
            } else {
                temp = nums[indexI]
            }

            biggest = max(biggest, temp)
        }

        return biggest
    }
}

/// 记忆化搜索
class Solution198Memory {
    var memory: [Int]!

    func rob(_ nums: [Int]) -> Int {
        memory = Array(repeating: -1, count: nums.count)

        return rob(nums, index: 0)
    }

    private func rob(_ nums: [Int], index: Int) -> Int {
        if memory[index] != -1 {
            return memory[index]
        }

        var biggest = 0

        for indexI in index..<nums.count {
            var temp = 0

            if indexI + 2 < nums.count {
                temp = nums[indexI] + rob(nums, index: indexI + 2)
            } else {
                temp = nums[indexI]
            }

            biggest = max(biggest, temp)
        }

        memory[index] = biggest

        return biggest
    }
}
/// 动态规划
class SolutionDP {
    var memory: [Int]!

    func rob(_ nums: [Int]) -> Int {
        guard nums.count > 2 else {
            if nums.count == 1 {
                return nums[0]
            }else if nums.count == 2 {
                return max(nums[0], nums[1])
            }else {
                return 0
            }
        }

        memory = Array(repeating: -1, count: nums.count + 1)

        memory[0] = nums[0]

        memory[1] = max(nums[0], nums[1])

        for index in 2..<nums.count {
            memory[index] = max(nums[index] + memory[index - 2], memory[index - 1])
        }

        return memory[nums.count - 1]
    }
}

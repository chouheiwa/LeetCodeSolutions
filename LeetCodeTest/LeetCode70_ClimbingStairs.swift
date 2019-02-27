//
//  LeetCode70_ClimbingStairs.swift
//  LeetCodeTest
//
//  Created by Di on 2019/2/26.
//  Copyright © 2019 chouheiwa. All rights reserved.
//

import Foundation

/// 原题:
/// 你正在攀爬一个台阶数为n的楼梯，你每次只能选择上1个台阶或者2个台阶。爬上这个楼梯，你可以用多少种方式爬上这座楼梯?
/// You are climbing a stair case. It takes n steps to reach to the top.
/// Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?

/// n 不会为负数
/// 普通递归
class Solution70 {
    func climbStairs(_ n: Int) -> Int {
        /// 因为我们每次爬楼梯，只能选择爬1个或者2个台阶。
        /// 所以我们这次爬楼梯的可能只能是(n-1)阶台阶的可能 加上 (n-2)阶台阶的可能
        /// 如我们选择爬3阶楼梯，我们的可能便是[1, 2]（(n - 2)阶台阶）[1, 1, 1], [2 , 1]（(n - 1) 阶台阶）
        if n < 2 {
            return 1
        }

        return climbStairs(n - 2) + climbStairs(n - 1)
    }
}
/// 记忆化搜索
class Solution70Memory {
    var memory: [Int] = [1, 1]

    func climbStairs(_ n: Int) -> Int {
        if memory.count > n {
            return memory[n]
        }

        let temp = climbStairs(n - 2) + climbStairs(n - 1)

        memory.append(temp)

        return temp
    }
}
/// 动态规划
class Solution70DP {
    var memory: [Int] = [1, 1]

    func climbStairs(_ n: Int) -> Int {
        if memory.count > n {
            return memory[n]
        }
        for index in 2...n {
            if memory.count > index {
                continue
            }

            memory.append(memory[index - 2] + memory[index - 1])
        }

        return memory[n]
    }
}

class Solution70DP_Optimize {
    var n1 = 1
    var n2 = 1

    func climbStairs(_ n: Int) -> Int {
        n1 = 1
        n2 = 1

        if n < 2 {
            return 1
        }

        for index in 2..<n {
            if index % 2 == 0 {
                n1 = n1 + n2
            } else {
                n2 = n1 + n2
            }
        }

        return n1 + n2
    }
}

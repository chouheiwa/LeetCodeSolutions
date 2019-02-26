//
//  LeetCode343_IntegerBreak.swift
//  LeetCodeTest
//
//  Created by Di on 2019/2/26.
//  Copyright © 2019 chouheiwa. All rights reserved.
//

import Foundation

/// 原题:
/// 给定一个自然数n，将它分解为若干个自然数(至少有两个)的和，并计算这些自然数的乘积，给出乘积最大值
/// Given a positive integer n, break it into the sum of at least two positive integers and maximize the product of those integers. Return the maximum product you can get.

/// 例子:
/// 如给定数字为2:
/// 则 2 = 1 + 1， 1 x 1 = 1
/// 如给定数字为10:
/// 则 10 = 3 + 3 + 4， 3 x 3 x 4 = 36

/// 暴力搜索
class Solution343 {
    func integerBreak(_ n: Int) -> Int {
        if n == 1 {
            return 1
        }

        var biggest = 0

        for index in 2..<n {
            var temp = integerBreak(index) * (n - index)
            // 这里需要取对index进行拆解求积和直接相乘的较大值
            // 为什么要这么做?
            // 我这里以4为例:
            // 4 可以 被分解 为2 + 2
            // 若index是2，其分解后的计算因数乘积最大值为1，比其原始值小，因此2不应分解，应直接相乘
            temp = max(temp, index * (n - index))

            biggest = max(temp, biggest)
        }

        return biggest
    }
}

/// 记忆化搜索法
class Solution343Memory {
    var memory: [Int] = [0, 1]

    func integerBreak(_ n: Int) -> Int {
        if memory.count > n {
            return memory[n]
        }

        var biggest = 0

        for index in 1..<n {
            var temp = integerBreak(index) * (n - index)

            temp = max(temp, index * (n - index))

            biggest = max(biggest, temp)
        }

        if memory.count <= n {
            memory.append(biggest)
        }

        return biggest
    }
}
/// 动态规划版 (DP)
class Solution343DP {
    var memory: [Int]!

    func integerBreak(_ n: Int) -> Int {
        memory = Array(repeating: -1, count: n + 1)

        memory[0] = 0
        memory[1] = 1

        for index in 2...n {
            var biggest = 0
            for indexJ in 1..<index {
                var temp = memory[indexJ] * (index - indexJ)

                temp = max(temp, indexJ * (index - indexJ))

                biggest = max(biggest, temp)
            }

            memory[index] = biggest
        }

        return memory[n]
    }
}



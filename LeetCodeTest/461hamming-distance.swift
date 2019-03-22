//
//  461hamming-distance.swift
//  LeetCodeTest
//
//  Created by Di on 2019/3/22.
//  Copyright © 2019 chouheiwa. All rights reserved.
//

import Foundation

/**
 两个整数之间的 汉明 距离指的是这两个数字对应二进制位不同的位置的数目。

 给出两个整数 x 和 y，计算它们之间的汉明距离。

 注意：
 0 ≤ x, y < 231.

 示例:

 输入: x = 1, y = 4

 输出: 2

 解释:
 1   (0 0 0 1)
 4   (0 1 0 0)
        ↑   ↑

 上面的箭头指出了对应二进制位不同的位置。

 https://leetcode-cn.com/problems/hamming-distance/
 */
class Solution461 {
    /// 我的解决方案
    func mySolutionHammingDistance(_ x: Int, _ y: Int) -> Int {
        let xy = x ^ y

        var result = 0

        for index in 0..<32 {
            let item = (1 << index)

            if xy < item {
                break
            }

            if (xy & item) != 0 {
                result += 1
            }
        }

        return result
    }
    /// Swift中最快解决方案
    func hammingDistance(_ x: Int, _ y: Int) -> Int {
        var r = x ^ y
        /// 这个就是计算位数为1的方法
        var count = 0

        /// 一个非常叼的方法
        /// 73: 1
        while r != 0 {
            r = r & (r - 1)
            count += 1
        }
        return count
    }
}

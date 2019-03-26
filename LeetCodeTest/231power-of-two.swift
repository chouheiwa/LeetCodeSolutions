//
//  231.swift
//  LeetCodeTest
//
//  Created by Di on 2019/3/25.
//  Copyright © 2019 chouheiwa. All rights reserved.
//

import Foundation

/**
 给定一个整数，编写一个函数来判断它是否是 2 的幂次方。

 示例 1:

 输入: 1
 输出: true
 解释: 20 = 1
 示例 2:

 输入: 16
 输出: true
 解释: 24 = 16
 示例 3:

 输入: 218
 输出: false

 https://leetcode-cn.com/problems/power-of-two/
 */
class Solution231 {
    /// 这道题相当有意思
    /// 通用解法我们可以进行
    func isPowerOfTwo(_ n: Int) -> Bool {
        return (n & (n - 1) == 0) && n > 0
    }
}


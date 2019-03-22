//
//  476number-complement.swift
//  LeetCodeTest
//
//  Created by Di on 2019/3/22.
//  Copyright © 2019 chouheiwa. All rights reserved.
//

import Foundation
/**
 给定一个正整数，输出它的补数。补数是对该数的二进制表示取反。

 注意:

 给定的整数保证在32位带符号整数的范围内。
 你可以假定二进制数不包含前导零位。
 示例 1:

 输入: 5
 输出: 2
 解释: 5的二进制表示为101（没有前导零位），其补数为010。所以你需要输出2。
 示例 2:

 输入: 1
 输出: 0
 解释: 1的二进制表示为1（没有前导零位），其补数为0。所以你需要输出0。
 https://leetcode-cn.com/problems/number-complement/
 */
class Solution476 {
    func findComplement(_ num: Int) -> Int {
        var result = 0

        for index in 0..<32 {
            let item = 1 << index

            if item > num {
                break
            }

            if (num & item) == 0 {
                result |= item
            }
        }

        return result
    }
}

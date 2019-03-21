//
//  942DiStringMatch.swift
//  LeetCodeTest
//
//  Created by Di on 2019/3/21.
//  Copyright © 2019 chouheiwa. All rights reserved.
//

import Foundation

/// 给定只含 "I"（增大）或 "D"（减小）的字符串 S ，令 N = S.length。

/// 返回 [0, 1, ..., N] 的任意排列 A 使得对于所有 i = 0, ..., N-1，都有：

/// 如果 S[i] == "I"，那么 A[i] < A[i+1]
/// 如果 S[i] == "D"，那么 A[i] > A[i+1]


class Solution942 {
    func diStringMatch(_ S: String) -> [Int] {
        var left = 0
        var right = S.count

        var array: [Int] = []

        for character in S {
            if character == "I" {
                array.append(left)
                left += 1
            } else {
                array.append(right)
                right -= 1
            }
        }

        array.append(left)

        return array
    }
}

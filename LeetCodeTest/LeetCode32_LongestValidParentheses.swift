//
//  LeetCode32_LongestValidParentheses.swift
//  LeetCodeTest
//
//  Created by Di on 2019/2/27.
//  Copyright © 2019 chouheiwa. All rights reserved.
//

import Foundation

/// 问题:
/// 给定一个只包含'('和')'的字符串，寻找有效子字符串中的最大长度
/// 如 "(()" 的最长有效字符串为"()" 长度为2
/// 如 "(()())"的最长有效字符串为"(()())" 长度为6

/// Given a string containing just the characters '(' and ')', find the length of the longest valid (well-formed) parentheses substring.
class Solution32Stack {
    // 我们加这个索引的原因:
    // 首先Swift 中的 String的相关操作存在着一定的坑，因为Swift对于字符串并未采取等宽字节，所以Swift中字符串的范围截取操作类的复杂度不是O(1),而是O(k)。这种复杂度，使得我们需要在一些频繁进行字符串截取的操作上产生一定的问题。因题目中无中文|表情等特殊符号，故此，这里采用ASCII码来进行特殊处理
    let left: Int8 = "(".withCString({$0.pointee})
    let right: Int8 = ")".withCString({$0.pointee})

    func longestValidParentheses(_ s: String) -> Int {

        var array: [Int] = []

        let count: Int = s.count

        var biggest = 0

        s.withCString {
            var start = 0

            for index in 0..<count {
                let pointer = $0 + index

                let value = pointer.pointee

                if value == left {
                    array.append(index)
                } else {
                    if array.isEmpty {
                        start = index + 1
                    } else {
                        _ = array.popLast()

                        if array.isEmpty {
                            biggest = max(biggest, index - start + 1)
                        } else {
                            biggest = max(biggest, index - array[array.count - 1])
                        }
                    }
                }
            }
        }

        return biggest
    }
}

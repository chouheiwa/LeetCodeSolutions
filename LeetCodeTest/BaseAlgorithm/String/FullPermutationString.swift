//
//  FullPermutationString.swift
//  LeetCodeTest
//
//  Created by Di on 2019/3/18.
//  Copyright © 2019 chouheiwa. All rights reserved.
//

import Foundation

/// 问题:
/// 任意给定一个字符串(不存在特殊字符以及中文等情况)，返回这个字符串所有可能排序
class Solution {
    func premutation(_ string: String) -> [String] {
        // 将其转化成数组
        var array = string.utf8CString.map({$0})
        // 因为utf8CString结尾处会多一个0，因此直接移除
        array.removeLast()

        var results: [String] = []

        exchange(array, start: 0, end: array.count, result: &results)

        return results
    }

    func exchange(_ array: [Int8], start: Int, end: Int, result: inout [String]) {
        var changeArray = array

        if start == end {
            // 在这里添加一个尾缀，直接初始化
            changeArray.append(0)

            result.append(changeArray.withUnsafeBufferPointer({String.init(cString: $0.baseAddress!)}))

            return
        }

        for index in start..<end {
            if changeArray[index] == changeArray[start] && index != start {
                continue
            }

            let temp = changeArray[index]
            changeArray[index] = changeArray[start]
            changeArray[start] = temp

            exchange(changeArray, start: index + 1, end: end, result: &result)
        }
    }
}

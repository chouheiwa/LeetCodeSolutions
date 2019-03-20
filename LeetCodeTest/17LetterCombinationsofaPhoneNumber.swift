//
//  17LetterCombinationsofaPhoneNumber.swift
//  LeetCodeTest
//
//  Created by Di on 2019/3/19.
//  Copyright © 2019 chouheiwa. All rights reserved.
//

import Foundation

/// 问题:给定一个仅包含数字 2-9 的字符串，返回所有它能表示的字母组合。
/// 给出数字到字母的映射如下（与电话按键相同）。注意 1 不对应任何字母
/// 如同手机端

class Solution17 {
    let dic: [Int8: [Int8]]

    init() {
        // 这里我们定义相关数据的初始化信息
        var dic: [Int8: [Int8]] = [:]

        let two = "2".utf8CString[0]

        var item: Int8 = "a".utf8CString[0]

        for index: Int8 in 0...7 {
            var length = 3

            if index == 5 || index == 7 {
                length = 4
            }

            var array: [Int8] = []

            for _ in 0..<length {
                array.append(item)

                item += 1
            }

            dic[two + index] = array
        }

        self.dic = dic
    }

    func letterCombinations(_ digits: String) -> [String] {
        guard digits.count > 0 else {
            return []
        }

        var keyArray = digits.utf8CString.map({$0})

        keyArray.removeLast()

        var results: [String] = []

        keyCombinations(keyArray, currentResult: [], end: keyArray.count, results: &results)

        return results
    }

    private func keyCombinations(_ value: [Int8], currentResult: [Int8], end: Int, results: inout [String]) {
        if currentResult.count == end {
            var copyResult = currentResult

            copyResult.append(0)

            results.append(copyResult.withUnsafeBufferPointer({String.init(cString: $0.baseAddress!)}))

            return
        }

        let keyValue = dic[value[currentResult.count]]!

        for item in keyValue {
            var copyResult = currentResult

            copyResult.append(item)

            keyCombinations(value, currentResult: copyResult, end: end, results: &results)
        }
    }
}

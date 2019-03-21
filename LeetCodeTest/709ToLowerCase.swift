//
//  709ToLowerCase.swift
//  LeetCodeTest
//
//  Created by Di on 2019/3/21.
//  Copyright © 2019 chouheiwa. All rights reserved.
//

import Foundation

/// 问题:
/// 实现函数 ToLowerCase()，该函数接收一个字符串参数 str，并将该字符串中的大写字母转换成小写字母，之后返回新的字符串。

class Solution709 {
    func toLowerCase(_ str: String) -> String {
        var array = str.utf8CString

        for index in 0..<array.count {
            let item = array[index]

            if item >= 65 && item <= 90 {
                array[index] = item + 32
            }
        }

        return String(cString: array.withUnsafeBufferPointer({$0.baseAddress!}))
    }
}

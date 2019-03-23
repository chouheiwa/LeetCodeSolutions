//
//  500keyboard-row.swift
//  LeetCodeTest
//
//  Created by Di on 2019/3/23.
//  Copyright © 2019 chouheiwa. All rights reserved.
//

import Foundation
/**
 给定一个单词列表，只返回可以使用在键盘同一行的字母打印出来的单词。键盘如标准笔记本键盘。



 示例：

 输入: ["Hello", "Alaska", "Dad", "Peace"]
 输出: ["Alaska", "Dad"]


 注意：

 你可以重复使用键盘上同一字符。
 你可以假设输入的字符串将只包含字母。

 https://leetcode-cn.com/problems/keyboard-row/
 */

class Solution500 {
    let keyDic: [Character:Int] = ["q": 1,"w": 1,"e": 1,"r": 1,"t": 1,"y": 1,"u": 1,"i": 1,"o": 1,"p": 1,"a": 2,"s": 2,"d": 2,"f": 2,"g": 2,"h": 2,"j": 2,"k": 2,"l": 2,"z": 3,"x": 3,"c": 3,"v": 3,"b": 3,"n": 3,"m": 3]

    func findWords(_ words: [String]) -> [String] {
        var results: [String] = []

        for word in words {
            let item = word.lowercased()

            if word.isEmpty { continue }

            var key: Int = 0

            var success: Bool = true

            for character in item {
                if key == 0 {
                    key = keyDic[character]!
                    continue
                }

                if keyDic[character]! != key {
                    success = false
                    break
                }
            }

            if success {
                results.append(word)
            }
        }

        return results
    }
}

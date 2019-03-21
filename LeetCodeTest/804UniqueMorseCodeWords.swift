//
//  804UniqueMorseCodeWords.swift
//  LeetCodeTest
//
//  Created by Di on 2019/3/21.
//  Copyright © 2019 chouheiwa. All rights reserved.
//

import Foundation

/// 问题:国际摩尔斯密码定义一种标准编码方式，将每个字母对应于一个由一系列点和短线组成的字符串， 比如: "a" 对应 ".-", "b" 对应 "-...", "c" 对应 "-.-.", 等等。
/// 为了方便，所有26个英文字母对应摩尔斯密码表如下：

///[".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--.."]

/// https://leetcode-cn.com/problems/unique-morse-code-words/

class Solution804 {
    let keyMap = [".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--.."]

    func uniqueMorseRepresentations(_ words: [String]) -> Int {
        return Set<String>(words.map({ (word) -> String in
            var string = ""

            word.unicodeScalars.forEach({string += keyMap[Int($0.value) - 97]})

            return string
        })).count
    }
}

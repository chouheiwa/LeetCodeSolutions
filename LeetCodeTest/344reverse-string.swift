//
//  344reverse-string.swift
//  LeetCodeTest
//
//  Created by Di on 2019/3/25.
//  Copyright © 2019 chouheiwa. All rights reserved.
//

import Foundation

class Solution344 {
    func reverseString(_ s: inout [Character]) {
        var index = 0

        while index * 2 + 1 < s.count {
            let temp = s[index]

            s[index] = s[s.count - index - 1]
            s[s.count - index - 1] = temp

            index += 1
        }
    }
}

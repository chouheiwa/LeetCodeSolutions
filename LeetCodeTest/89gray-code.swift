//
//  89gray-code.swift
//  LeetCodeTest
//
//  Created by Di on 2019/3/26.
//  Copyright © 2019 chouheiwa. All rights reserved.
//

import Foundation

class Solution89 {
    func grayCode(_ n: Int) -> [Int] {
        var current = 0

        var results = [0]

        while current < n {
            let length = results.count

            for index in 0..<length {
                results.append(results[length - index - 1] + 1 << current)
            }

            current += 1
        }
        return results
    }
}

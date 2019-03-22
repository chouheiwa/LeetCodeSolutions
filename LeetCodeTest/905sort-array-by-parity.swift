//
//  905sort-array-by-parity.swift
//  LeetCodeTest
//
//  Created by Di on 2019/3/21.
//  Copyright © 2019 chouheiwa. All rights reserved.
//

import Foundation


class Solution905 {
    func sortArrayByParity(_ A: [Int]) -> [Int] {
        var copyA = A

        var end = copyA.count - 1

        var start = 0

        while start < end {
            if copyA[start] & 0x1 == 1 {
                copyA[start] ^= copyA[end]
                copyA[end] = copyA[start] ^ copyA[end]
                copyA[start] ^= copyA[end]
                end -= 1
            } else {
                start += 1
            }
        }
        return copyA
    }
}

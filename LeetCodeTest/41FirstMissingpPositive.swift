//
//  41FirstMissingpPositive.swift
//  LeetCodeTest
//
//  Created by Di on 2019/3/20.
//  Copyright © 2019 chouheiwa. All rights reserved.
//

import Foundation

class Solution41 {
    func firstMissingPositive(_ nums: [Int]) -> Int {
        guard nums.count > 0 else {
            return 1
        }

        let pointer: UnsafeMutablePointer<Int> = nums.withUnsafeBufferPointer({UnsafeMutablePointer(mutating: $0.baseAddress!)})

        var indexI = 0

        while indexI < nums.count {
            let item = nums[indexI]

            if item <= nums.count &&
                item > 0 &&
                item != (indexI + 1) &&
                item != nums[item - 1] {
                (pointer + indexI).pointee = nums[item - 1]

                (pointer + item - 1).pointee = item

                continue
            }

            indexI += 1
        }

        for (index, item) in nums.enumerated() {
            if item != index + 1 {
                return index + 1
            }
        }

        return nums.count + 1
    }
}

//
//  39CombinationSum.swift
//  LeetCodeTest
//
//  Created by Di on 2019/3/20.
//  Copyright © 2019 chouheiwa. All rights reserved.
//

import Foundation

// 

class Solution39 {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var can = candidates

        can.sort()

        return solution(can, target)
    }

    private func solution(_ candidates: [Int], _ target: Int) -> [[Int]] {
        guard candidates.count > 0 else {
            return []
        }

        guard candidates[0] <= target else {
            return []
        }

        var array: [[Int]] = []

        for index in 0..<candidates.count {
            if candidates[index] > target {
                break
            }

            if candidates[index] == target {
                array.append([target])
                break
            }

            let arrays = solution([Int](candidates[index..<candidates.count]), target - candidates[index])

            for item in arrays {
                var copyItem = item

                copyItem.append(candidates[index])

                array.append(copyItem)
            }
        }
        return array
    }
}

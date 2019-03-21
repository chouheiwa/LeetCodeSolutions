//
//  977SquaresOfASortedArray.swift
//  LeetCodeTest
//
//  Created by Di on 2019/3/21.
//  Copyright © 2019 chouheiwa. All rights reserved.
//

import Foundation

class Solution977 {
    func sortedSquares(_ A: [Int]) -> [Int] {
        var first = A.count
        var last = A.count - 1

        for (index, item) in A.enumerated() {
            if item >= 0 {
                first = index

                if index > 0 {
                    last = index - 1
                } else {
                    last = -1
                }
                break
            }
        }



        var result: [Int] = []

        while first < A.count || last > -1  {
            if last == -1 {
                result.append(A[first] * A[first])

                first += 1
                continue
            }

            if first == A.count {
                result.append(A[last] * A[last])

                last -= 1
                continue
            }

            let firstItem = A[first]
            let lastItem = abs(A[last])

            if firstItem < lastItem {
                result.append(firstItem * firstItem)
                first += 1
            } else {
                result.append(lastItem * lastItem)
                last -= 1
            }
        }
        return result
    }
}

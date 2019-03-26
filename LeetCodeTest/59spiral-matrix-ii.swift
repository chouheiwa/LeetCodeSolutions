//
//  59spiral-matrix-ii.swift
//  LeetCodeTest
//
//  Created by Di on 2019/3/26.
//  Copyright © 2019 chouheiwa. All rights reserved.
//

import Foundation
/**
 给定一个正整数 n，生成一个包含 1 到 n2 所有元素，且元素按顺时针顺序螺旋排列的正方形矩阵。

 示例:

 输入: 3
 输出:
 [
 [ 1, 2, 3 ],
 [ 8, 9, 4 ],
 [ 7, 6, 5 ]
 ]

 */
//[
//    [ 1, 2, 3, 4],
//    [12,13,14, 5],
//    [11,16,15, 6],
//    [10, 9, 8, 7]
//]



class Solution59 {
    func generateMatrix(_ n: Int) -> [[Int]] {
        var results: [[Int]] = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: n), count: n)

        var current = 1
        let final = n * n
        var x = 0
        var y = 0

        var begin = 0

        while current <= final {
            results[y][x] = current

            current += 1

            let limit = n - begin - 1

            if y == begin && x < limit {
                x += 1
                continue
            }

            if x == limit && y < limit {
                y += 1
                continue
            }

            if y == limit && x > begin {
                x -= 1
                continue
            }

            if x == begin && y > begin + 1 {
                y -= 1
                continue
            }

            begin += 1
            x = begin
        }
        return results
    }
}

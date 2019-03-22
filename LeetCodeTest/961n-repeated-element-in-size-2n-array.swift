//
//  961n-repeated-element-in-size-2n-array.swift
//  LeetCodeTest
//
//  Created by Di on 2019/3/21.
//  Copyright © 2019 chouheiwa. All rights reserved.
//

import Foundation

/**
 在大小为 2N 的数组 A 中有 N+1 个不同的元素，其中有一个元素重复了 N 次。

 返回重复了 N 次的那个元素。



 示例 1：

 输入：[1,2,3,3]
 输出：3
 示例 2：

 输入：[2,1,2,5,3,2]
 输出：2
 示例 3：

 输入：[5,1,5,2,5,3,5,4]
 输出：5

 提示：

 4 <= A.length <= 10000
 0 <= A[i] < 10000
 A.length 为偶数
 */

class Solution961 {
    func repeatedNTimes(_ A: [Int]) -> Int {
        for index in 0..<A.count - 2 {
            if A[index] == A[index + 1] || A[index] == A[index + 2] {
                return A[index]
            }
        }

        return A[A.count - 1]
    }
}

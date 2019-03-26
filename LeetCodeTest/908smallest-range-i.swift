//
//  908smallest-range-i.swift
//  LeetCodeTest
//
//  Created by Di on 2019/3/25.
//  Copyright © 2019 chouheiwa. All rights reserved.
//

import Foundation
/**
 给定一个整数数组 A，对于每个整数 A[i]，我们可以选择任意 x 满足 -K <= x <= K，并将 x 加到 A[i] 中。

 在此过程之后，我们得到一些数组 B。

 返回 B 的最大值和 B 的最小值之间可能存在的最小差值。



 示例 1：

 输入：A = [1], K = 0
 输出：0
 解释：B = [1]
 示例 2：

 输入：A = [0,10], K = 2
 输出：6
 解释：B = [2,8]
 示例 3：

 输入：A = [1,3,6], K = 3
 输出：0
 解释：B = [3,3,3] 或 B = [4,4,4]

 https://leetcode-cn.com/problems/smallest-range-i/
 */
class Solution908 {
    func smallestRangeI(_ A: [Int], _ K: Int) -> Int {
        guard !A.isEmpty else { return 0 }

        let A = A.sorted()

        return max(0, (A.last! - K) - (A.first! + K))
    }
}

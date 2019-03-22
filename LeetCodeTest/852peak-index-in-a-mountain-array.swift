//
//  852peak-index-in-a-mountain-array.swift
//  LeetCodeTest
//
//  Created by Di on 2019/3/22.
//  Copyright © 2019 chouheiwa. All rights reserved.
//

import Foundation

/**
 我们把符合下列属性的数组 A 称作山脉：

 A.length >= 3
 存在 0 < i < A.length - 1 使得A[0] < A[1] < ... A[i-1] < A[i] > A[i+1] > ... > A[A.length - 1]
 给定一个确定为山脉的数组，返回任何满足 A[0] < A[1] < ... A[i-1] < A[i] > A[i+1] > ... > A[A.length - 1] 的 i 的值。

 https://leetcode-cn.com/problems/peak-index-in-a-mountain-array/
 */
class Solution852 {
    /// 相当于已经排序数列，可以采取二分查找法复杂度 O(log n)
    func peakIndexInMountainArray(_ A: [Int]) -> Int {
        return mountain(0, A.count-1, A)
    }

    func mountain(_ from:Int,_ to:Int,_ A: [Int]) -> Int{
        if from == to{ return to }
        if from == to - 1 { return A[from]>A[to] ? from : to }
        let mid = (from + to)/2
        if A[mid-1] < A[mid] && A[mid] > A[mid+1]{
            return mid
        }
        if A[mid] < A[mid+1] {
            return mountain(mid,to,A)
        }else{
            return mountain(from,mid,A)
        }
    }

    func myPeakIndexInMountainArray(_ A: [Int]) -> Int {
        var lastIndex = 0

        for (index, item) in A.enumerated() {
            if index == 0 {
                continue
            }

            if item < A[lastIndex] {
                return lastIndex
            }

            lastIndex = index
        }
        return lastIndex
    }
}

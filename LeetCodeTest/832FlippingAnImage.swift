//
//  832FlippingAnImage.swift
//  LeetCodeTest
//
//  Created by Di on 2019/3/21.
//  Copyright © 2019 chouheiwa. All rights reserved.
//

import Foundation

/// 问题:给定一个二进制矩阵 A，我们想先水平翻转图像，然后反转图像并返回结果。

/// 水平翻转图片就是将图片的每一行都进行翻转，即逆序。例如，水平翻转 [1, 1, 0] 的结果是 [0, 1, 1]。

/// 反转图片的意思是图片中的 0 全部被 1 替换， 1 全部被 0 替换。例如，反转 [0, 1, 1] 的结果是 [1, 0, 0]。

/// https://leetcode-cn.com/problems/flipping-an-image/

class Solution832 {
    func flipAndInvertImage(_ A: [[Int]]) -> [[Int]] {
        var copyA = A

        let length = copyA.count

        let cutLength = copyA.count / 2

        for indexI in 0..<length {
            for indexJ in 0..<length {
                var currentVal = copyA[indexI][indexJ]

                if indexJ < cutLength {
                    currentVal = copyA[indexI][copyA.count - indexJ - 1]
                    copyA[indexI][copyA.count - indexJ - 1] = copyA[indexI][indexJ]
                }

                if currentVal == 0 {
                    currentVal = 1
                } else {
                    currentVal = 0
                }

                copyA[indexI][indexJ] = currentVal
            }
        }

        return copyA
    }
}



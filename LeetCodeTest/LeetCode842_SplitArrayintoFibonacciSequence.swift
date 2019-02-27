//
//  LeetCode842SplitArrayintoFibonacciSequence.swift
//  LeetCodeTest
//
//  Created by Di on 2019/2/26.
//  Copyright © 2019 chouheiwa. All rights reserved.
//

import Foundation

/// 原题:
/// 我们将一个给定的字符串进行分割，分割成斐波那契数列
/// Given a string S of digits, such as S = "123456579", we can split it into a Fibonacci-like sequence [123, 456, 579].

private extension String {
    var leadingZero: Bool {
        guard self.count > 1 else {
            return false
        }

        if self[self.startIndex] == "0" {
            return true
        }

        return false
    }
}

class Solution842 {
    var limit: Int = 2_147_483_647

    func splitIntoFibonacci(_ S: String) -> [Int] {
        if S.count < 3 {
            return []
        }
        var array: [String] = []

        for index in 1...(min(10, S.count - 2)) {
            let firstString = String(S.prefix(index))

            let lastString = String(S.suffix(S.count - index))

            array.append(firstString)

            if firstString.leadingZero {
                return []
            }

            if findSecondSecondString(String(lastString), list: &array) {
                return array.map({Int($0) ?? 0})
            } else {
                array.removeAll()
            }
        }

        return []
    }

    func findSecondSecondString(_ S: String, list: inout [String]) -> Bool {
        if S.count  < 1 {
            return false
        }

        for index in 1...(min(10, S.count - 1)) {
            let firstString = String(S.prefix(index))

            let lastString = String(S.suffix(S.count - index))

            list.append(firstString)

            if judgeStringCanUse(lastString, list: &list) {
                return true
            } else {
                let keep = list[0]
                list.removeAll()
                list.append(keep)
                continue
            }
        }
        return false
    }

    func judgeStringCanUse(_ S: String, list: inout [String]) -> Bool {
        if S.count == 0 && list.count > 2 {
            return true
        }

        let n = Int(list[list.count - 1]) ?? 0
        let n1 = Int(list[list.count - 2]) ?? 0
        let target = n + n1
        guard n <= limit && n1 <= limit && target <= limit else {
            return false
        }

        let targetString = "\(n + n1)"

        let firstS = S.prefix(targetString.count)

        if firstS == targetString {
            list.append(String(firstS))

            return judgeStringCanUse(String(S.suffix(S.count - firstS.count)), list: &list)
        }

        return false
    }
}

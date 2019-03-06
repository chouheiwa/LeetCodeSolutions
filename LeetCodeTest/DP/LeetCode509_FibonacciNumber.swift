//
//  LeetCode509_FibonacciNumber.swift
//  LeetCodeTest
//
//  Created by Di on 2019/2/26.
//  Copyright © 2019 chouheiwa. All rights reserved.
//

import Foundation

/// 原题:
/// 求斐波那契数列的第n个数:
/// F(0) = 0,   F(1) = 1
/// F(N) = F(N - 1) + F(N - 2), for N > 1.
/// The Fibonacci numbers, commonly denoted F(n) form a sequence, called the Fibonacci sequence, such that each number is the sum of the two preceding ones, starting from 0 and 1. That is,

/// 注:
/// 因此题同LeetCode70，因此，不写出逐步推导过程了

class Solution509 {
    var memory: [Int] = [0, 1]

    func fib(_ N: Int) -> Int {
        if memory.count > N {
            return memory[N]
        }
        for index in 2...N {
            if memory.count > index {
                continue
            }

            memory.append(memory[index - 2] + memory[index - 1])
        }

        return memory[N]
    }
}

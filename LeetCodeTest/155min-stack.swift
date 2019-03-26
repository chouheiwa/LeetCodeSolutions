//
//  155min-stack.swift
//  LeetCodeTest
//
//  Created by Di on 2019/3/25.
//  Copyright © 2019 chouheiwa. All rights reserved.
//

import Foundation

/**
 设计一个支持 push，pop，top 操作，并能在常数时间内检索到最小元素的栈。

 push(x) -- 将元素 x 推入栈中。
 pop() -- 删除栈顶的元素。
 top() -- 获取栈顶元素。
 getMin() -- 检索栈中的最小元素。
 示例:

 MinStack minStack = new MinStack();
 minStack.push(-2);
 minStack.push(0);
 minStack.push(-3);
 minStack.getMin();   --> 返回 -3.
 minStack.pop();
 minStack.top();      --> 返回 0.
 minStack.getMin();   --> 返回 -2.

 */
class MinStack {
    var stack: [Int] = []
    var min: [Int] = []
    /** initialize your data structure here. */
    init() {

    }

    func push(_ x: Int) {
        stack.append(x)

        guard var lastMin = min.last else {
            min.append(x)
            return
        }

        lastMin = Swift.min(lastMin, x)

        min.append(lastMin)
    }

    func pop() {
        stack.removeLast()
        min.removeLast()
    }

    func top() -> Int {
        return stack.last ?? 0
    }

    func getMin() -> Int {
        return min.last ?? 0
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(x)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */

//
//  559maximum-depth-of-n-ary-tree.swift
//  LeetCodeTest
//
//  Created by Di on 2019/3/24.
//  Copyright © 2019 chouheiwa. All rights reserved.
//

import Foundation
/**
 给定一个 N 叉树，找到其最大深度。

 最大深度是指从根节点到最远叶子节点的最长路径上的节点总数。

 https://leetcode-cn.com/problems/maximum-depth-of-n-ary-tree/
 */

class Solution559 {
    class Node {
        var val: Int = 0
        var children: [Node] = []
    }

    func maxDepth(_ root: Node?) -> Int {
        guard let root = root else { return 0 }

        var length = 0

        for child in root.children {
            length = max(length, maxDepth(child))
        }

        return length + 1
    }
}

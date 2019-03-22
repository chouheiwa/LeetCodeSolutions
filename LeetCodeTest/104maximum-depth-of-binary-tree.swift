//
//  104maximum-depth-of-binary-tree.swift
//  LeetCodeTest
//
//  Created by Di on 2019/3/22.
//  Copyright © 2019 chouheiwa. All rights reserved.
//

import Foundation


/**
 给定一个二叉树，找出其最大深度。

 二叉树的深度为根节点到最远叶子节点的最长路径上的节点数。

 说明: 叶子节点是指没有子节点的节点。

 示例：
 给定二叉树 [3,9,20,null,null,15,7]，

     3
    / \
   9  20
     /  \
    15   7
 返回它的最大深度 3 。
 */

class Solution104 {
    class TreeNode {
        var val: Int = 0
        var left: TreeNode?
        var right: TreeNode?
    }

    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }

        return max(maxDepth(root.left), maxDepth(root.right)) + 1
    }
}

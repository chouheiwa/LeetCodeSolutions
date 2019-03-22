//
//  226invert-binary-tree.swift
//  LeetCodeTest
//
//  Created by Di on 2019/3/22.
//  Copyright © 2019 chouheiwa. All rights reserved.
//

import Foundation

/**
 翻转一棵二叉树。

 示例：

 输入：

      4
    /   \
   2     7
  / \   / \
 1   3 6   9
 输出：

      4
    /   \
   7     2
  / \   / \
 9   6 3   1

 */
class Solution226 {
    class TreeNode {
        var val: Int = 0
        var left: TreeNode?
        var right: TreeNode?
    }

    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }

        let temp = root.left

        root.left = invertTree(root.right)

        root.right = invertTree(temp)

        return root
    }
}

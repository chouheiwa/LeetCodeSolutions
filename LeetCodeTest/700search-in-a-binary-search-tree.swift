//
//  700search-in-a-binary-search-tree.swift
//  LeetCodeTest
//
//  Created by Di on 2019/3/24.
//  Copyright © 2019 chouheiwa. All rights reserved.
//

import Foundation

/**
 给定二叉搜索树（BST）的根节点和一个值。 你需要在BST中找到节点值等于给定值的节点。 返回以该节点为根的子树。 如果节点不存在，则返回 NULL。

 例如，

 给定二叉搜索树:

     4
    / \
   2   7
  / \
 1   3

 和值: 2
 你应该返回如下子树:

   2
  / \
 1   3

 https://leetcode-cn.com/problems/search-in-a-binary-search-tree/
 */

class Solution700 {
    class TreeNode {
        var val: Int = 0
        var left: TreeNode?
        var right: TreeNode?
    }

    func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let root = root else { return nil }

        if root.val == val {
            return root
        }

        if let value = searchBST(root.left, val) {
            return value
        }

        if let value = searchBST(root.right, val) {
            return value
        }

        return nil
    }
}

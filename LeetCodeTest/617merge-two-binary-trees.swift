//
//  617merge-two-binary-trees.swift
//  LeetCodeTest
//
//  Created by Di on 2019/3/22.
//  Copyright © 2019 chouheiwa. All rights reserved.
//

import Foundation
/**
 给定两个二叉树，想象当你将它们中的一个覆盖到另一个上时，两个二叉树的一些节点便会重叠。

 你需要将他们合并为一个新的二叉树。合并的规则是如果两个节点重叠，那么将他们的值相加作为节点合并后的新值，否则不为 NULL 的节点将直接作为新二叉树的节点。

 https://leetcode-cn.com/problems/merge-two-binary-trees/
 */
class Solution617 {

    class TreeNode {
        var val: Int = 0
        var left: TreeNode?
        var right: TreeNode?
    }

    func mergeTrees(_ t1: TreeNode?, _ t2: TreeNode?) -> TreeNode? {
        guard let t1_ = t1, let t2_ = t2 else {
            if t1 != nil {
                return t1
            }

            if t2 != nil {
                return t2
            }

            return nil
        }

        t1_.val += t2_.val

        t1_.left = mergeTrees(t1_.left, t2_.left)

        t1_.right = mergeTrees(t1_.right, t2_.right)

        return t1_
    }
}

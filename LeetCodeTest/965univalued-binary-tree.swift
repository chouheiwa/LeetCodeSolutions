//
//  965univalued-binary-tree.swift
//  LeetCodeTest
//
//  Created by Di on 2019/3/22.
//  Copyright © 2019 chouheiwa. All rights reserved.
//

import Foundation

class Solution965 {
    class TreeNode {
        var val: Int
        var left: TreeNode?
        var right: TreeNode?
        init(_ val: Int) {
            self.val = val
            self.left = nil
            self.right = nil
        }
    }

    func isUnivalTree(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }

        if let left = root.left {
            if left.val != root.val {
                return false
            }
        }

        if let right = root.right {
            if right.val != root.val {
                return false
            }
        }

        return isUnivalTree(root.left) && isUnivalTree(root.right)
    }
}

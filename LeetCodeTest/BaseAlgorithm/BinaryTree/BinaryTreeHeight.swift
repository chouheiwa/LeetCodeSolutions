//
//  BinaryTreeHeight.swift
//  LeetCodeTest
//
//  Created by Di on 2019/3/6.
//  Copyright © 2019 chouheiwa. All rights reserved.
//

import Foundation

// 问题:
// 给定一个二叉树，求树高(从根节点，到最长的那个子节点的距离)

class BinaryTreeHeightTree {
    var left: BinaryTreeHeightTree?
    var right: BinaryTreeHeightTree?
}

class BinaryTreeHeightSolution {
    func solution(_ root: BinaryTreeHeightTree?) -> Int {
        // 如果根节点不存在，则树高为0
        guard let root = root else {
            return 0
        }
        // 获取左右子节点的树高(递归调用将返回左右节点的树高)
        let leftHeight = solution(root.left)
        let rightHeight = solution(root.right)
        // 这里需要将树高加1并返回(算上自己这层的树高)
        return max(leftHeight, rightHeight) + 1
    }
}

//
//  RingList.swift
//  LeetCodeTest
//
//  Created by Di on 2019/3/6.
//  Copyright © 2019 chouheiwa. All rights reserved.
//

import Foundation

/// 问题:
/// 给定一个链表,检查其是否成环
/// (限定条件，空间复杂度O(1))

class RingLinkList {
    var next: RingLinkList?
}

class RingLinkListSoluation {
    func soluation(_ root: RingLinkList) -> Bool {
        return reach(slow: root, fast: root.next)
    }
    /// 这里的思路是采用差速遍历
    /// 首先空间复杂度需要为O(1)证明我们不能使用类似hash表之类的辅助表记录
    /// 这里先梳理一下已知条件:
    /// 1.环状链表如果进行遍历，将永远不会退出循环
    ///
    /// 1 -* 2 -* 3 -* 4
    ///      *         |
    ///      |         *
    ///      7 *- 6 *- 5
    /// -*: 代表着链表的下一个节点
    /// 根据示意图我们可以看出来 当我们处于图示中的环形链表的时候，循环将会一直发生在2-7中，永远不会退出
    ///
    /// 2.若想知道链表成环，我们至少需要两个指针变量，通过比较他们是否相等来确定
    ///
    /// 所以这里我们的思路可以继续了
    /// 在这里我们就可以简化这个问题了，我们可以把问题定义成小学时候学习过的追击问题
    /// 接下来我们可以继续想，如果两个人以一定的间隔跑圈，什么情况下他们两个能相遇呢?
    /// 肯定需要两个人的速度存在差异 1个快 1个慢
    ///
    /// 程序也是如此设计，只是我们把跑的快的那个放在前面，跑的慢的放在后面，这样子，当两个人都进入环状的时候快的可以追上慢的
    /// 同时如果不是环的情况下，快的肯定会先遍历完毕

    func reach(slow: RingLinkList, fast: RingLinkList?) -> Bool {
        // 如果fast是空的话，则说明肯定不是环
        guard let fast = fast else {
            return false
        }
        // 确认终止条件: 两个指针相遇
        if slow === fast {
            return true
        }
        // 这里无需进行判空，因为fast指针永远会在slow指针的前面，所以slow必定有值
        let nextSlow = slow.next!
        // fast需要判空
        guard let nextFast = fast.next else {
            return false
        }
        // 差速体现在了slow每次递归调用时只前进1次
        // fast每次递归会前进两个格，他们如果在环中，终将会相遇
        return reach(slow: nextSlow,fast: nextFast.next)
    }
}

//
//  main.swift
//  LeetCodeTest
//
//  Created by Di on 2019/2/26.
//  Copyright © 2019 chouheiwa. All rights reserved.
//

import Foundation

print("Hello, World!")

func caculateTime(_ block: ()->Void) {
    let date = Date()
    block()
    print("执行当前命令消耗时间\(Date().timeIntervalSince(date))")
}

//for item in Solution59().generateMatrix(5) {
//    print(item)
//}

func judge(_ n: Int) {

    let array = Solution89().grayCode(n)

    var set: Set<Int> = Set()

    for index in 2..<array.count {
        assert(!set.contains(array[index]))

        set.insert(array[index])

        let result = array[index - 1] ^ array[index]

        assert(result & (result - 1) == 0)
    }

    
}

judge(11)



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

//var str = "a"

var list = [1]

for _ in 0..<28 {
    caculateTime {
        print("当前字符串长度:\(list.count)")
    }
    list += list
}



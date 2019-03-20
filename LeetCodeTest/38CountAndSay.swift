//
//  38CountAndSay.swift
//  LeetCodeTest
//
//  Created by Di on 2019/3/20.
//  Copyright © 2019 chouheiwa. All rights reserved.
//

import Foundation

class Solution38 {
    var array: [String] = ["1"]

    func countAndSay(_ n: Int) -> String {
        guard n > 0 else {
            return ""
        }

        guard array.count < n else {
            return array[n - 1]
        }

        let count = array.count

        for index in count..<n {
            let item = array[index - 1]

            array.append(compressString(item))
        }

        return array[n - 1]
    }

    private func compressString(_ string: String) -> String {
        var length = 1
        var lastCharacter: Character = "\0"
        var result = ""
        for item in string {
            if item != lastCharacter {
                if lastCharacter != "\0" {
                    result = "\(result)\(length)\(lastCharacter)"
                }
                lastCharacter = item
                length = 1
                continue
            }

            length += 1
        }

        result = "\(result)\(length)\(lastCharacter)"

        return result
    }
}

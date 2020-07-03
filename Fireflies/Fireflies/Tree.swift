//
//  Tree.swift
//  Fireflies
//
//  Created by Abhishek Chandrashekar on 03/07/20.
//  Copyright © 2020 ANC. All rights reserved.
//

import Foundation

public class TreeNode {

    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?

    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }

}

class Solution {

    func traverseDownLR(_ root: TreeNode?) -> [[Int]]{
        if root?.left == nil && root?.right == nil {
            return []
        }

        let la = traverseDownLR(root?.left)
        let ra = traverseDownLR(root?.right)
        var resultStage = [[Int]]()
        let currarray  = [root?.left?.val ?? -1, root?.right?.val ?? -1]
        if la.count == 0 && ra.count == 0  {
            resultStage = [[root?.left?.val ?? -1, root?.right?.val ?? -1]]
        } else if la.count == 0 {
            resultStage.append(ra.first ?? [] )
        } else if ra.count == 0 {
            resultStage.append(la.first ?? [])
        } else {
            resultStage.append( la.first ?? [] )
            resultStage.append( ra.first ?? [] )
        }
        resultStage.append( currarray)
        return resultStage
    }

}

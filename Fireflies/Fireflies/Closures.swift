//
//  Closures.swift
//  Fireflies
//
//  Created by Abhishek Chandrashekar on 03/07/20.
//  Copyright © 2020 ANC. All rights reserved.
//

import Foundation


class userClass{
    var userName: String = "classname"
}

struct userStruct {
    var userName: String = "strcutname"
}


class TestClass {
    
//        var humanTrialClass : userClass
//        var humanTrialStruct : userStruct
        
    //    var humanTrialClass : userClass?
    //    var humanTrialStruct : userStruct?
    
    init() {
//        humanTrialClass = nil
//        humanTrialStruct = nil
    }
}

struct TestStruct {
    
        var humanTrialClass : userClass
        var humanTrialStruct : userStruct
        
    //    var humanTrialClass : userClass?
    //    var humanTrialStruct : userStruct?
    
}






        /*
        var localname = "l1"
        presentor?.testClosure { [localname,myname,weak testClassInstance] in
//            guard let strongSelf  = self else {
//                return
//            }
            print(myname)
            print(localname)
            
            myname = "L3"
            print(self.myname)
            print(testClassInstance?.userName)
            print(self.testStructInstance.userName)
            print(CFGetRetainCount(testClassInstance))
        }
        localname = "L2"
        myname = "2"
        testClassInstance.userName = "modified class name"
        testStructInstance.userName = "modified struct name"

        
        print("=====================")
        let node = TreeNode()
        node.val = 3
        node.left  = TreeNode(9)
        node.right  = TreeNode(20, TreeNode(15), TreeNode(7))
        let sol = Solution()
        let solll = sol.traverseDownLR(node)
        print(solll)
        */

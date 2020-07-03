//
//  ListViewController.swift
//  Fireflies
//
//  Created by Abhishek Chandrashekar on 30/06/20.
//  Copyright © 2020 ANC. All rights reserved.
//

import UIKit
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

class ListViewController: UIViewController {
    
    @IBOutlet weak var listview: UITableView!
    
    var presentor:ListPresenterInputProtocol?
    
    var myname :String = "1"
    var testClassInstance = userClass()
    var testStructInstance = userStruct()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        var localname = "l1"
        print(CFGetRetainCount(testClassInstance))

        presentor?.testClosure { [localname,myname,weak testClassInstance] in
//            guard let strongSelf  = self else {
//                return
//            }
            print(myname)
            print(localname)
            
//            myname = "L3"
//            print(self.myname)
            print(testClassInstance?.userName)
            print(self.testStructInstance.userName)
            print(CFGetRetainCount(testClassInstance))
        }
        localname = "L2"
        myname = "2"
        testClassInstance.userName = "modified class name"
        testStructInstance.userName = "modified struct name"
        
        ///
        presentor?.startFetchingMediaItems()
        // Do any additional setup after loading the view.
        
        print("=====================")
        
        let node = TreeNode()

        node.val = 3

        node.left  = TreeNode(9)

        node.right  = TreeNode(20, TreeNode(15), TreeNode(7))

        let sol = Solution()

        

        let solll = sol.traverseDownLR(node)
        print(solll)
    }

}

extension ListViewController: ListPresenterOutputProtocol {
    
    func showItems(noticeArray: Array<Media>) {
        DispatchQueue.main.async {
            self.listview.reloadData()
        }
    }
    
    func showError() {
        
    }
    
    
}

extension ListViewController : UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presentor?.mediaList.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as! ListTableViewCell
        guard let media = presentor?.mediaList[indexPath.row] else {
            return UITableViewCell.init()
        }
        cell.header.text = media.name
        return cell
    }
    
}

//struct UserS {
//    var friend: UserS?
//}
//struct UserS1 {
//    var friends: [UserS1] //indirect
//}
//
//class UserC {
//    var friend: UserC?
//
//    init() {
//        friend = nil
//    }
//}
//class UserC1 {
//    var friends: [UserC1]?
//
//    init() {
//        friends = nil
//    }
//}




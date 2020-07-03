//
//  ListViewController.swift
//  Fireflies
//
//  Created by Abhishek Chandrashekar on 30/06/20.
//  Copyright © 2020 ANC. All rights reserved.
//

import UIKit


class ListViewController: UIViewController {
    
    @IBOutlet weak var listview: UITableView!
    
    var presentor:ListPresenterInputProtocol?
    
    
    //closures
    var myname :String = "1"
    var testClassInstance = userClass()
    var testStructInstance = userStruct()
    //closures
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presentor?.startFetchingMediaItems()


        print("============closures============")
        var localname = "l1"
        presentor?.testClosure { [localname,myname,weak testClassInstance] in
            /*
            guard let strongSelf  = self else {
                return
            } */
            print(myname)
            print(localname)
            
            //myname = "L3"
            print(self.myname)
            print(testClassInstance?.userName)
            print(self.testStructInstance.userName)
            print(CFGetRetainCount(testClassInstance))
        }
        localname = "L2"
        myname = "2"
        testClassInstance.userName = "modified class name"
        testStructInstance.userName = "modified struct name"
        print("============closures============")

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

//
//  ViewController.swift
//  Fireflies
//
//  Created by Abhishek Chandrashekar on 25/06/20.
//  Copyright © 2020 ANC. All rights reserved.
//

import UIKit
protocol Item {
    var itemName: String { get set}
}
protocol Sample {
    associatedtype itemtype: Item
    var tems : [itemtype] {get set}
}
class ViewController: UIViewController  {
    var items: [String] = []
    typealias Item = String
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    func loginAsync(onsuccess:(String)->()) {
        
    }

    func login() {
        self.loginAsync { (_) in
            //
        }
    }
}


//
//  FRPViewController.swift
//  Fireflies
//
//  Created by Abhishek Chandrashekar on 03/07/20.
//  Copyright © 2020 ANC. All rights reserved.
//

import UIKit

class FRPViewController: UIViewController {
    var integers = [1,2,3,4,5,6,7]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var intG5 = integers.filter { (key) -> Bool in
            key > 5
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

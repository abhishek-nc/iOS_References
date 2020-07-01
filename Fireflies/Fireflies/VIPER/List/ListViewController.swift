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

    override func viewDidLoad() {
        super.viewDidLoad()
        presentor?.startFetchingMediaItems()
        // Do any additional setup after loading the view.
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
        return 14
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

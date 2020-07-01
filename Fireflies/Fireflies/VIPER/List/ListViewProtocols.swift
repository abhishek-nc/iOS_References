//
//  ListViewProtocols.swift
//  Fireflies
//
//  Created by Abhishek Chandrashekar on 30/06/20.
//  Copyright © 2020 ANC. All rights reserved.
//

import Foundation
import UIKit

// #Step 1 ; write all communication protocol
protocol ListPresenterInputProtocol: class{
    
    var view: ListPresenterOutputProtocol? {get set}
    var interactor: ListInteractorInputProtocol? {get set}
    var router: ListRouterProtocol? {get set}
    
    var mediaList: Array<Media> {get}
    func startFetchingMediaItems()
    func showMediaDetailController(navigationController:UINavigationController)

}

protocol ListPresenterOutputProtocol: class{
    func showItems(noticeArray:Array<Media>)
    func showError()
}

protocol ListRouterProtocol: class {
    static func createModule()-> ListViewController
    func pushDetailScreen(navigationConroller:UINavigationController)
}

protocol ListInteractorInputProtocol: class {
    var presenter:ListInteractorOutputProtocol? {get set}
    func fetchNotice()
}

protocol ListInteractorOutputProtocol: class {
    func mediaFetchedSuccess(noticeModelArray:Array<Media>)
    func mediaFetchFailed()
}

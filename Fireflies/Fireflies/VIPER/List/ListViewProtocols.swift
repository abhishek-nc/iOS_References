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

// presenter
protocol ListPresenterInputProtocol: class{
    
    var view: ListPresenterOutputProtocol? {get set}
    var interactor: ListInteractorInputProtocol? {get set}
    var router: ListRouterProtocol? {get set}
    
    var mediaList: Array<Media> {get}
    
    func startFetchingMediaItems()
    
    func showMediaDetailController(navigationController:UINavigationController)
    
    func testClosure(closure:@escaping ()->Void) 
}

//view-viewcontroller
protocol ListPresenterOutputProtocol: class{
    func showItems(noticeArray:Array<Media>)
    func showError()
}

//router
protocol ListRouterProtocol: class {
    static func createModule()-> ListViewController
    func pushDetailScreen(navigationConroller:UINavigationController)
}

//interactor
protocol ListInteractorInputProtocol: class {
    var presenter:ListInteractorOutputProtocol? {get set}
    func fetchNotice()
}

//presentor-from Interactor
protocol ListInteractorOutputProtocol: class {
    func mediaFetchedSuccess(noticeModelArray:Array<Media>)
    func mediaFetchFailed()
}

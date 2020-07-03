//
//  ListPresenter.swift
//  Fireflies
//
//  Created by Abhishek Chandrashekar on 30/06/20.
//  Copyright © 2020 ANC. All rights reserved.
//

import Foundation
import UIKit

class ListPresenter: ListPresenterInputProtocol {
    weak var view: ListPresenterOutputProtocol?
    var interactor: ListInteractorInputProtocol?
    var router: ListRouterProtocol?
    
    //data
    var mediaList:Array<Media> = Array()
    
    //delegates
    
    
    //closures
    var myclosure: (()->Void)?
    
    func startFetchingMediaItems() {
        interactor?.fetchNotice()
    }
    
    func showMediaDetailController(navigationController: UINavigationController) {
        
    }
    
    //closures
    func testClosure(closure:@escaping ()->Void) {
        myclosure = closure
    }

    
    
}

extension ListPresenter: ListInteractorOutputProtocol {
    func mediaFetchedSuccess(noticeModelArray: Array<Media>) {
        mediaList = noticeModelArray
        DispatchQueue.main.async {
            self.view?.showItems(noticeArray: noticeModelArray)
        }
        myclosure?()
    }
    
    func mediaFetchFailed() {
        
    }
    
    
}

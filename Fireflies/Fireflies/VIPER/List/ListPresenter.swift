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
    
    var mediaList:Array<Media> = Array()

    func startFetchingMediaItems() {
        interactor?.fetchNotice()
    }
    
    func showMediaDetailController(navigationController: UINavigationController) {
        
    }
    

    
    
}

extension ListPresenter: ListInteractorOutputProtocol {
    func mediaFetchedSuccess(noticeModelArray: Array<Media>) {
        mediaList = noticeModelArray
        DispatchQueue.main.async {
            self.view?.showItems(noticeArray: noticeModelArray)
        }
    }
    
    func mediaFetchFailed() {
        
    }
    
    
}

//
//  ListRouter.swift
//  Fireflies
//
//  Created by Abhishek Chandrashekar on 30/06/20.
//  Copyright © 2020 ANC. All rights reserved.
//

import Foundation
import UIKit

// #step2 setup module
class ListRouter : ListRouterProtocol {
    
    static func createModule() -> ListViewController {
        
        let view = UIStoryboard(name:"Main",bundle: Bundle.main).instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
        
        let presenter = ListPresenter()
        let interactor = ListInteractor()
        let router = ListRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
        
    }
    
    func pushDetailScreen(navigationConroller: UINavigationController) {
        
    }
    
}

//
//  ListInteractor.swift
//  Fireflies
//
//  Created by Abhishek Chandrashekar on 30/06/20.
//  Copyright © 2020 ANC. All rights reserved.
//

import Foundation

class ListInteractor : ListInteractorInputProtocol {
    weak var presenter: ListInteractorOutputProtocol?
    
    func fetchNotice() {
        let request = URLRequest(url: URL(string: "https://api.npoint.io/33aff47446e89f78f93c")!)
        NetworkEngine.sharedInstance.execute(request: request) { (result: NetworkResponse<MediaList>) in
            switch  result {
            case let .success(items): self.presenter?.mediaFetchedSuccess(noticeModelArray: items?.result ?? [])
            case .failure(_): self.presenter?.mediaFetchFailed()
            }
        }
    }
    
}

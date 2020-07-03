//
//  NetworkEngine.swift
//  Fireflies
//
//  Created by Abhishek Chandrashekar on 30/06/20.
//  Copyright © 2020 ANC. All rights reserved.
//

import Foundation

protocol ErrorrRule : Error{
    var message: String {get }
    var code: Int {get }
}

enum NWError : ErrorrRule {
    var message: String {
        switch self {
        default: return "somethingWentWrong"
        }
    }
    var code: Int {
        switch self {
         default: return 0
        }
    }
    
    case somethingWentWrong
    
}

typealias NetworkResponse<R> = Result<R?,Error>
typealias NetworkResponseCompletion<R> = (NetworkResponse<R>)->()

class NetworkEngine  {
    
    static let sharedInstance = NetworkEngine()
    let session = URLSession.shared
    
    private init() {
    }
    
    func execute<R:Decodable>(request: URLRequest, onResponse:@escaping NetworkResponseCompletion<R>) {

        let task = session.dataTask(with: request, completionHandler: { data, response, error in
            if let err = error {
                 onResponse(Result.failure(err))
            }
            do {
                //let jsonData = try JSONSerialization.data(withJSONObject: data!, options: .prettyPrinted)
                //print(jsonData)
                let result = try JSONDecoder().decode(R.self, from: data! )
                onResponse(Result.success(result))
            } catch {
                onResponse(Result.failure(NWError.somethingWentWrong))
            }
        })
        task.resume()
    }
    
}

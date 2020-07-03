//
//  Entity.swift
//  Fireflies
//
//  Created by Abhishek Chandrashekar on 30/06/20.
//  Copyright © 2020 ANC. All rights reserved.
//

import Foundation

struct MediaList: Decodable {
    var result : [Media] = []
    
    enum CodingKeys : String, CodingKey {
        case result = "result"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        result = try container.decodeIfPresent([Media].self, forKey: .result) ?? []
        
        //xlet dic = [String:Media] ()
        //result = dic.values
    }
    
}

struct Media : Decodable {
    var name: String
}

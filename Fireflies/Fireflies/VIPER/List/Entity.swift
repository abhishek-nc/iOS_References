//
//  Entity.swift
//  Fireflies
//
//  Created by Abhishek Chandrashekar on 30/06/20.
//  Copyright © 2020 ANC. All rights reserved.
//

import Foundation

struct MediaList: Decodable {
    var result : [Media]
}

struct Media : Decodable {
    var name: String
}

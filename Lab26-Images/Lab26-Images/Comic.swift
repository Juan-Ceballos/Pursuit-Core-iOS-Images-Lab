//
//  Comic.swift
//  Lab26-Images
//
//  Created by Juan Ceballos on 12/11/19.
//  Copyright © 2019 Juan Ceballos. All rights reserved.
//

import Foundation

struct Comic: Decodable {
    let num: Int
    let img: String
    
    var randomNum: Int  {
        return Int.random(in: 1...num)
    }
}

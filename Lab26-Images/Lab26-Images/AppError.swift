//
//  AppError.swift
//  Lab26-Images
//
//  Created by Juan Ceballos on 12/11/19.
//  Copyright © 2019 Juan Ceballos. All rights reserved.
//

import Foundation

enum AppError: Error    {
    case badURL(String)
    case noResponse
    case networkClientError(Error)
    case noData
    case decodingError(Error)
    case badStatusCode(Int)
    case badMimeType(String)
}

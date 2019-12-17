//
//  ComicAPI.swift
//  Lab26-Images
//
//  Created by Juan Ceballos on 12/11/19.
//  Copyright © 2019 Juan Ceballos. All rights reserved.
//

import Foundation

struct ComicAPI {
    static func getComic(comicURL: String, completion: @escaping(Result <Comic, AppError>) -> ())  {
        
        NetworkHelper.shared.performDataTask(with: comicURL) { (result) in
            switch result   {
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
                print(appError)
            case .success(let data):
                do  {
                    let comics = try JSONDecoder().decode(Comic.self, from: data)
                    completion(.success(comics))
                }
                catch   {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
    }
}

//
//  UIImageView + Extensions.swift
//  Lab26-Images
//
//  Created by Juan Ceballos on 12/11/19.
//  Copyright © 2019 Juan Ceballos. All rights reserved.
//

import UIKit

extension UIImageView   {
    func setImage(with urlString: String, completion: @escaping(Result<UIImage, AppError>) -> ())    {
        NetworkHelper.shared.performDataTask(with: urlString) { (result) in
            switch result   {
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                if let image = UIImage(data: data)  {
                    completion(.success(image))
                }
            }
        }
    }
}

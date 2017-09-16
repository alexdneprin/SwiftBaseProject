//
//  UIImageView.swift
//  Base
//
//  Created by Alexander Slobodjanjuk on 16.09.2017.
//  Copyright © 2017 Alexander Slobodjanjuk. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage

extension UIImageView {
    public func setImageWithURL(_ url: String, filter: ImageFilter? = nil, placeholder: UIImage? = nil, completion: ((DataResponse<UIImage>) -> Void)? = nil) {
        af_setImage(withURL: URL(string: url)!, placeholderImage: placeholder, filter: filter, imageTransition: .crossDissolve(0.3), completion: {
            (response: DataResponse<UIImage>) in
            if let error = response.result.error {
                print(error.localizedDescription)
            }
            completion?(response)
        })
    }
}

//
//  photoManager.swift
//  QuotePro
//
//  Created by Chris Dean on 2018-03-28.
//  Copyright © 2018 Chris Dean. All rights reserved.
//

import Foundation
import UIKit

class PhotoManager {
    
    func lorempixelNetworkRequest(completionHandler: @escaping (UIImage) -> Void) {

        
        if let url = URL(string: "https://lorempixel.com/400/200/sports/") {
        
            let data = try? Data(contentsOf: url)
            if let imageData = data, let image = UIImage(data: imageData) {
                
                completionHandler(image)
            }
        
        }
    }
    
}

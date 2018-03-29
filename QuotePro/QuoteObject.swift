//
//  QuoteObject.swift
//  QuotePro
//
//  Created by Chris Dean on 2018-03-28.
//  Copyright © 2018 Chris Dean. All rights reserved.
//

import Foundation
import UIKit

class QuoteObject {
    
    
    var author: String
    var quote: String
    var photoObject: PhotoObject?
    

    
    init(author: String, quote: String) {
        self.author = author
        self.quote = quote
    }
    
}



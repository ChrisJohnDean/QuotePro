//
//  QuoteView.swift
//  QuotePro
//
//  Created by Chris Dean on 2018-03-28.
//  Copyright © 2018 Chris Dean. All rights reserved.
//

import UIKit

class QuoteView: UIView {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var quoteText: UILabel!
    @IBOutlet weak var authorName: UILabel!
    
    func setUpWithQuote(quoteObject: QuoteObject) {
        backgroundImage.image = quoteObject.photoObject?.photo
        quoteText.text = quoteObject.quote
        authorName.text = quoteObject.author
    }
    
    
}

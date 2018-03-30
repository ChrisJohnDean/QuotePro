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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setUpWithQuote(quoteObject: QuoteObject) {
        DispatchQueue.main.async {
            self.backgroundImage.image = quoteObject.photoObject?.photo
            self.quoteText.text = "\"\(quoteObject.quote)\""
            self.authorName.text = "- " + quoteObject.author
        }
    }
    
    
}

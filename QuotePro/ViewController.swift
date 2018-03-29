//
//  ViewController.swift
//  QuotePro
//
//  Created by Chris Dean on 2018-03-28.
//  Copyright © 2018 Chris Dean. All rights reserved.
//
import Foundation
import UIKit

class ViewController: UIViewController {

    var quoteView = QuoteView()
    var photoObject: PhotoObject?
    var quoteObject: QuoteObject?
    var quoteManager: QuoteManager?
    var photoManager: PhotoManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        quoteManager = QuoteManager()
        photoManager = PhotoManager()
        
        let quoteView = Bundle.main.loadNibNamed("QuoteView", owner: nil, options: nil)?.first! as! QuoteView
        quoteView.center = CGPoint(x: 50, y: 100)
        self.view.addSubview(quoteView)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func newQuote(_ sender: Any) {
        quoteManager?.forismaticNetworkRequest() {(quoteObject: QuoteObject) in
            self.quoteObject = quoteObject
            self.quoteView.setUpWithQuote(quoteObject: self.quoteObject!)
        }
    }
    
    @IBAction func newPhoto(_ sender: Any) {
        photoManager?.lorempixelNetworkRequest() {(image: UIImage) in
            self.photoObject = PhotoObject(photo: image)
            self.quoteObject?.photoObject = self.photoObject
            self.quoteView.setUpWithQuote(quoteObject: self.quoteObject!)
        }
    }
    
    @IBAction func saveQuoteView(_ sender: Any) {
    }
    

}


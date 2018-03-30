//
//  ViewController.swift
//  QuotePro
//
//  Created by Chris Dean on 2018-03-28.
//  Copyright © 2018 Chris Dean. All rights reserved.
//
import Foundation
import UIKit


protocol AddQuoteDelegate: class {
    func addQuote(quoteObject: QuoteObject)
}

class ViewController: UIViewController {

    weak var delegate: AddQuoteDelegate?
    
    var quoteView = QuoteView()
    var photoObject: PhotoObject!
    var quoteObject: QuoteObject?
    var quoteManager: QuoteManager?
    var photoManager: PhotoManager?
    
    @IBOutlet weak var newPhotoOulet: UIButton!
    @IBOutlet weak var newQuoteOutlet: UIButton!
    @IBOutlet weak var saveOutlet: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeButtonsLookCool(button: newPhotoOulet)
        makeButtonsLookCool(button: newQuoteOutlet)
        makeButtonsLookCool(button: saveOutlet)
        // Do any additional setup after loading the view, typically from a nib.
    }

    func makeButtonsLookCool(button: UIButton) {
        button.layer.cornerRadius = 5
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 2.5, height: 2.5)
        button.layer.shadowRadius = 5
        button.layer.shadowOpacity = 1.0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        quoteManager = QuoteManager()
        photoManager = PhotoManager()
        
        quoteView = Bundle.main.loadNibNamed("QuoteView", owner: nil, options: nil)?.first! as! QuoteView
        //quoteView.center = self.view.center
        //quoteView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height/4)
        self.view.addSubview(quoteView)
        quoteView.translatesAutoresizingMaskIntoConstraints = false
        quoteView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        quoteView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        quoteView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        quoteView.heightAnchor.constraint(equalToConstant: self.view.frame.height/2).isActive = true
        
        
        photoManager?.lorempixelNetworkRequest() {(image: UIImage) in
            self.photoObject = PhotoObject(photo: image)
            self.quoteManager?.forismaticNetworkRequest() {(quoteObject: QuoteObject) in
                self.quoteObject = quoteObject
                self.quoteObject?.photoObject = self.photoObject
                
                DispatchQueue.main.async {
                    self.quoteView.setUpWithQuote(quoteObject: self.quoteObject!)
                }
            }
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func newQuote(_ sender: Any) {
        quoteManager?.forismaticNetworkRequest() {(quoteObject: QuoteObject) in
            self.quoteObject = quoteObject
            self.quoteObject?.photoObject = self.photoObject
            DispatchQueue.main.async {
                self.quoteView.setUpWithQuote(quoteObject: self.quoteObject!)
            }
        }
    }
    
    @IBAction func newPhoto(_ sender: Any) {
        photoManager?.lorempixelNetworkRequest() {(image: UIImage) in
            self.photoObject = PhotoObject(photo: image)
            self.quoteObject?.photoObject = self.photoObject
            DispatchQueue.main.async {
                self.quoteView.setUpWithQuote(quoteObject: self.quoteObject!)
            }
            
        }
    }
    
    @IBAction func saveQuoteView(_ sender: Any) {
        guard let quoteObject = self.quoteObject else {return}
        delegate?.addQuote(quoteObject: quoteObject)
    }
    

}


//
//  QuotesTableViewController.swift
//  QuotePro
//
//  Created by Chris Dean on 2018-03-29.
//  Copyright © 2018 Chris Dean. All rights reserved.
//

import UIKit


class QuotesTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddQuoteDelegate {

 
    @IBOutlet weak var tableView: UITableView!
    var savedQuotesArray = Array<QuoteObject>()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedQuotesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let quoteObject = savedQuotesArray[indexPath.row]
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = quoteObject.author
        cell.detailTextLabel?.text = quoteObject.quote
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addQuote" {
            let vc = segue.destination as! ViewController
            vc.delegate = self
        }
    }
    
    func addQuote(quoteObject: QuoteObject) {
        savedQuotesArray.append(quoteObject)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let quoteObject = savedQuotesArray[indexPath.row]
        shareQuoteImage(quoteObject: quoteObject)
        
    }
    
    func shareQuoteImage(quoteObject: QuoteObject) {
        let quoteView = QuoteView()
        quoteView.setUpWithQuote(quoteObject: quoteObject)
        UIGraphicsBeginImageContext(quoteView.frame.size)
        quoteView.layer.render(in: UIGraphicsGetCurrentContext()!)
        let quoteImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        //let pngData = UIImagePNGRepresentation(quoteImage!)
        let activityViewController = UIActivityViewController(activityItems: [quoteImage!], applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController, animated: true, completion: nil)
    }
    
}












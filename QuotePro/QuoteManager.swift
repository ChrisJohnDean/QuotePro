//
//  QuoteManager.swift
//  QuotePro
//
//  Created by Chris Dean on 2018-03-28.
//  Copyright © 2018 Chris Dean. All rights reserved.
//

import Foundation

class QuoteManager {
    
    func forismaticNetworkRequest(completionHandler: @escaping (QuoteObject) -> Void) {
        
        var quoteObject: QuoteObject!
        
        
        guard let url = URL(string: "https://api.forismatic.com/api/1.0/?method=getQuote&lang=en&format=json") else {return}
        let request = NSURLRequest(url: url)
        let dataTask = URLSession.shared.dataTask(with: request as URLRequest) { (data: Data?, response: URLResponse?, error: Error?) in
            
            guard let data = data else {
                print("Received error: \(String(describing: error?.localizedDescription))")
                return
            }
            
            if let error = error {
                print("error during datatask to forismatic api \(String(describing: error))")
                return
            }
            
            quoteObject = self.parseJsonData(data: data)
            completionHandler(quoteObject)
        }
        dataTask.resume()
        
    }
 
    func parseJsonData(data: Data) -> QuoteObject {
        
        let defaultQuoteObject = QuoteObject(author: "Chris Dean", quote: "Whats all around goes around rick")
        
        guard let quoteDictFromJsonAny = try? JSONSerialization.jsonObject(with: data, options: []), let quoteDictFromJson = quoteDictFromJsonAny as? [String:String] else {
            print("data is not json")
            return defaultQuoteObject
        }
        
        guard let author = quoteDictFromJson["quoteAuthor"] else {return defaultQuoteObject}
        guard let quoteText = quoteDictFromJson["quoteText"] else {return defaultQuoteObject}
        
        let quoteObject = QuoteObject(author: author, quote: quoteText)
        return quoteObject
        
    }
    
}

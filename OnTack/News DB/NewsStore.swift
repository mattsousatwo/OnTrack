//
//  NewsStore.swift
//  OnTack
//
//  Created by Matthew Sousa on 6/10/21.
//

import Foundation
import Alamofire
import Combine
import SwiftUI

class NewsStore: ObservableObject {
    let decoder = JSONDecoder()
    
    @Published var articles = [Article]()
    
    func getAllNewsArticles() {
        let request = "https://newsapi.org/v2/everything?q=F1&sortBy=popularity?country=us&apiKey=3e26eedf13334d05b441d4520d268ca8"
        
        AF.request( request ).responseJSON { response in
            guard let json = response.data else { return }
            do {
                let decodedArticles = try self.decoder.decode(News.self, from: json)
                self.articles = decodedArticles.articles
            } catch {
                print(error)
            }
        }
    }
}

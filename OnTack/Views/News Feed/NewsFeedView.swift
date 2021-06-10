//
//  NewsFeedView.swift
//  OnTack
//
//  Created by Matthew Sousa on 6/10/21.
//

import SwiftUI

struct NewsFeedView: View {
    @ObservedObject var newsStore = NewsStore()
    
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(0..<newsStore.articles.count, id: \.self) { index in
                    
                    
                    NewsArticle(article: newsStore.articles[index])
                        .padding()
                    
                    
                }
            }
        }
        
        .frame(width: width,
               height: height,
               alignment: .center)
        
        
        .onAppear {
            newsStore.getAllNewsArticles()
        }
    }
    
}

struct NewsFeedView_Previews: PreviewProvider {
    static var previews: some View {
        NewsFeedView(width: 100, height: 100)
    }
}

//
//  NewsArticle.swift
//  OnTack
//
//  Created by Matthew Sousa on 6/10/21.
//

import SwiftUI

struct NewsArticle: View {
    
    let article: Article
    private let width = UIScreen.main.bounds.width - 60

    var body: some View {
        NavigationLink(destination:
                        NewsReader(article: article)) {
        RoundedRectangle(cornerRadius: 10)
            .frame(width: width,
                   height: 150,
                   alignment: .center)
            .foregroundColor(.blue)
            .overlay(
                HStack {
                    // UNWRAP URL
                    DownloadedImage(address: article.urlToImage,
                                    width: 80,
                                    height: 100,
                                    alignment: .center,
                                    cornerRadius: 10,
                                    shadowRadius: 0)
                        .padding()
                    VStack {
                        Text(article.title)
                            .bold()
                            .frame(width: (width / 2) + 40,
                                   height: 20,
                                   alignment: .leading)
                            .padding(.top)
                        
                        Text(article.articleDescription)
                            .fontWeight(.light)
                            .frame(width: (width / 2) + 40,
                                   height: 70,
                                   alignment: .leading)
                            .padding(.vertical, 5)
                    }
                }
                , alignment: .leading)
            
        
        }
        .buttonStyle(PlainButtonStyle())
//            .overlay(
//
//                // UNWRAP URL
//                DownloadedImage(address: article.urlToImage,
//                                width: 60,
//                                height: 60,
//                                alignment: .center,
//                                cornerRadius: 10,
//                                shadowRadius: 0)
//                    .padding()
//                , alignment: .topLeading)
//
//
//            .overlay(
//                Text(article.title)
//                    .padding()
//                , alignment: .top)
//            .overlay(
//                Text(article.articleDescription)
//                    .padding()
//                , alignment: .leading)
//
//
    }
}

struct NewsArticle_Previews: PreviewProvider {
    static var previews: some View {
        NewsArticle(article: Article(source: Source(id: "", name: ""),
                                     author: "Author",
                                     title: "Title",
                                     articleDescription: "Description",
                                     url: "link",
                                     urlToImage: "imageLink",
                                     publishedAt: "date",
                                     content: "content"))
    }
}

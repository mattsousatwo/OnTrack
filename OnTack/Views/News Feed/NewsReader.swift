//
//  NewsReader.swift
//  OnTack
//
//  Created by Matthew Sousa on 6/11/21.
//

import SwiftUI

struct NewsReader: View {
    
    let article: Article
    
    var body: some View {
        VStack {
            ScrollView {
                Text(article.content)
                    .padding()
                    .truncationMode(.head)
                    .multilineTextAlignment(.leading)
            }
            
            RoundedRectangle(cornerRadius: 0)
                .frame(width: UIScreen.main.bounds.width,
                       height: 100,
                       alignment: .center)
                .ignoresSafeArea(edges: .bottom)
        }
        .navigationTitle(article.source.name)
    }
    
}

struct NewsReader_Previews: PreviewProvider {
    static var previews: some View {
        NewsReader(article: Article(source: Source(id: "", name: ""),
                                     author: "Author",
                                     title: "Title",
                                     articleDescription: "Description",
                                     url: "link",
                                     urlToImage: "imageLink",
                                     publishedAt: "date",
                                     content: "content"))
    }
}

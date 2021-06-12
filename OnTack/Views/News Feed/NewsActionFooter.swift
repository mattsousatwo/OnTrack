//
//  NewsActionFooter.swift
//  OnTack
//
//  Created by Matthew Sousa on 6/11/21.
//

import SwiftUI

struct NewsActionFooter: View {
    
    private let width = UIScreen.main.bounds.width
    private let height = UIScreen.main.bounds.height / 10
    
    var body: some View {
        
        RoundedRectangle(cornerRadius: 0)
            .foregroundColor(.gray)
            .frame(width: width,
                   height: height,
                   alignment: .center)
            .overlay(
                HStack(alignment: .center, spacing: width / 3) {
                    ShareButton()
                        
                        
                    FavoriteButton()
                    
                    SafariButton()
                    
                }
                
            )
    }
}

struct NewsActionFooter_Previews: PreviewProvider {
    static var previews: some View {
        NewsActionFooter()
    }
}


struct ShareButton: View {
    var body: some View {
        Button(action: {
            print("Share")
        }, label: {
            Image(systemName: "square.and.arrow.up")
                .resizable()
                .frame(width: 25, height: 25,
                       alignment: .center)
        })
        .buttonStyle(PlainButtonStyle())
        
    }
}


struct FavoriteButton: View {
    var body: some View {
        Button(action: {
            print("Favorite")
        }, label: {
            Image(systemName: "heart")
                .resizable()
                .frame(width: 25, height: 25,
                       alignment: .center)
        })
        .buttonStyle(PlainButtonStyle())
    }
}

struct SafariButton: View {
    var body: some View {
        Button(action: {
            print("Safari Button")
        }, label: {
            Image(systemName: "safari")
                .resizable()
                .frame(width: 25, height: 25,
                       alignment: .center)
        })
        .buttonStyle(PlainButtonStyle())
    }
}




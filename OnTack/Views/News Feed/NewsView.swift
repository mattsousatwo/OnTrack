//
//  NewsView.swift
//  OnTack
//
//  Created by Matthew Sousa on 6/10/21.
//

import SwiftUI

struct NewsView: View {
    
    let width = UIScreen.main.bounds.width - 20
    let height = UIScreen.main.bounds.height / 5
    
    var newsFeedHeight: CGFloat {
        return (UIScreen.main.bounds.height - height) - 20
    }
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 20) {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.blue)
                .frame(width: UIScreen.main.bounds.width - 20,
                       height: UIScreen.main.bounds.height / 5,
                       alignment: .center)
            
            NewsFeedView(width: 100,
                         height: 400)
                
        }.padding()
        
        
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}

//
//  HomeTabView.swift
//  OnTack
//
//  Created by Matthew Sousa on 6/10/21.
//

import SwiftUI

struct HomeTabView: View {
    
    
    var body: some View {
        
        NavigationView {
            
            TabView {
                
                StandingsView()
                    .tabItem {
                        Image(systemName: "line.horizontal.3")
                        Text("Standings")
                    }.tag(1)
                
            }
            .navigationTitle(Text("On Track"))
            .navigationBarTitleDisplayMode(.inline)
            
        }
        
        
    }
    
    
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
    }
}

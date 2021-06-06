//
//  ContentView.swift
//  OnTack
//
//  Created by Matthew Sousa on 6/6/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.red
                .ignoresSafeArea()
            Text("Hello, world!")
                .padding()
        }
    } 
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  StandingsScrollView.swift
//  OnTack
//
//  Created by Matthew Sousa on 6/10/21.
//

import SwiftUI

struct StandingsScrollView: View {
    @ObservedObject var f1Store = FormulaOneStore()
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                ForEach(0..<f1Store.driverStandings.count, id: \.self) { index in
                    
                    let element = f1Store.driverStandings[index]

                    DriverCard(name: element.fullName(),
                               position: element.position,
                               points: element.points)
                        .padding(.vertical, 5)
                    
                    
                }
            }
        }
        .onAppear(perform: {
            f1Store.getDriverStandings()
        })
        
    }
}


struct StandingsScrollView_Previews: PreviewProvider {
    static var previews: some View {
        StandingsScrollView()
    }
}

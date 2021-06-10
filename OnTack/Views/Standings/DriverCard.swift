//
//  DriverCard.swift
//  OnTack
//
//  Created by Matthew Sousa on 6/10/21.
//

import SwiftUI

struct DriverCard: View {
    
    let width = UIScreen.main.bounds.width - 10
    let height = UIScreen.main.bounds.height
    // MARK: SET TO CONSTUCTOR COLOR
    let color = Color.blue
    let name: String
    let position: String
    let points: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .foregroundColor(color)
            .frame(width: width,
                   height: height / 4,
                   alignment: .center)
        
            // MARK: DRIVER NAME / CONSTRUCTOR LOGO
            .overlay(
                HStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: width / 8,
                               height: height / 15,
                               alignment: .center)
                    Text(name)
                        .font(.system(.title3, design: .rounded))
                        .bold()
                    
                }
                .padding()
                , alignment: .topLeading)
            
            // MARK: DRIVER IMAGE
            .overlay(
                VStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: width / 3,
                               height: height / 5)
                        .padding(.horizontal)
                }
                , alignment: .trailing)
            
            // MARK: POINTS / PLACEMENT
            .overlay(
                VStack(alignment: .leading) {
                    Text(position)
                        .font(.system(.title2, design: .rounded))
                        .bold()
                    Text(points + "pts")
                        .font(.system(.title2, design: .rounded))
                        .italic()
                        .bold()
                        .foregroundColor(.green)
                        
                }
                    .padding()
                , alignment: .bottomLeading
                
            )
    }
}



struct DriverCard_Previews: PreviewProvider {
    static var previews: some View {
        DriverCard(name: "First Last", position: "3rd", points: "12")
    }
}

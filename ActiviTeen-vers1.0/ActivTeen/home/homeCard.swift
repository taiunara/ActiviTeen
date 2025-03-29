//
//  Card.swift
//  ActivTeen
//
//  Created by found on 20/03/25.
//

import SwiftUI

struct homeCard: View {
    var text: String
    var image: String?
    var color: String
    
    var body: some View {
        
        
        ZStack(alignment: .bottom) {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.black, lineWidth: 2)
                .fill(Color(color))
                .frame(width: .infinity, height: .infinity)
            
            VStack {
                    if let image = image {
                    Image(image)
                           
                            .scaledToFit().frame(width: 150, height: 112)
                            .scaleEffect(1.02)
                        //.padding()
                }
                
                
                Text(text)
                    .colorMultiply(Color.black)
                    .font(.system(size: 15))
                    .font(.body)
                    .bold()
                    .fontWeight(.regular)
                    .foregroundStyle(Color.white)
                    .padding(.bottom,16)
            }
        }
        
    }
}

#Preview {
    homeCard(text: "Texto", image: "book", color: "challengers")
}

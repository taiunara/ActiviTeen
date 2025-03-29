//
//  ActivityCardView.swift
//  ActivTeen
//
//  Created by found on 20/03/25.
//

import SwiftUI

struct ActivityCardView: View {
    @Binding var isCompleted: Bool
    var text: String
    var color1: Color
    var color2: Color
    var textColor: Color
    
    var body: some View {
        ZStack {
        RoundedRectangle(cornerRadius: 10)
            .fill(isCompleted ? color2 : color1)
            .stroke(.black, lineWidth: 1)
            .frame(width: .infinity, height: .infinity)
            
            
            VStack(alignment: .leading) {
            HStack {
                Spacer()
                Button(action: {
                    isCompleted.toggle()
                }) {
                    Image(systemName: isCompleted ? "checkmark.circle.fill"  : "circle")
                        .foregroundColor(textColor)
                        .font(.system(size: 25))
                        
                }
            }
            
            Text(text)
                .font(.system(size: 15))
                .fontWeight(.regular)
                .foregroundColor(textColor)
                .padding(10)
                .multilineTextAlignment(.leading)
        }
        .padding()
        }
    }
}

#Preview {
    ActivityCardView(isCompleted: .constant(false), text: "Texto", color1: Color.greenTest, color2: Color.darkgreenTest, textColor:Color.white)
}

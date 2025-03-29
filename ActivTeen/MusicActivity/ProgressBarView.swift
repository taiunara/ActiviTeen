//
//  ProgressBarView.swift
//  ActivTeen
//
//  Created by found on 20/03/25.
//

import SwiftUI

struct ProgressBarView: View {
    @Binding var progress: Double
    var colorBar: Color
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Text("Seu progresso")
                    .font(.subheadline)
                    .foregroundColor(.black.opacity(0.5))
            }
            
            HStack {
                Text("\(Int(progress * 100))%")
                    .font(.title)
                    .fontWeight(.bold)
            }
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.gray.opacity(0.3))
                    .stroke(.black, lineWidth: 1)
                    .frame(height: 20)
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(colorBar)
                    .frame(width: CGFloat(progress) * UIScreen.main.bounds.width * 0.9, height: 20)
                    .animation(.easeInOut, value: progress)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        } .padding()

            }
}

#Preview {
    ProgressBarView(progress: .constant(0.25), colorBar: .darkgreenTest)
}


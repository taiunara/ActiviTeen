//
//  SwiftUIView.swift
//  ActivTeen
//
//  Created by user on 21/03/25.
//

import SwiftUI

struct ChallengerCard: View {
    var challengerNumber: Int
    var challenger: String
    var color: String
    var lockedColor: String
    var isLocked: Bool
    @Binding var isChecked: Bool
    
    var body: some View {
        ZStack(alignment: .leading) {
            //            Button{
            //                isChecked.toggle()
            //            }label: {
            //
            //
            //            }
            
            if isLocked {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 1)
                    .fill(Color(lockedColor))
                    .frame(width: .infinity, height: .infinity)
            } else if isChecked {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 1)
                    .fill(Color(Color.darkgreenTest))
                    .frame(width: .infinity, height: .infinity)
            } else {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 1)
                    .fill(Color.greenTest)
                    .frame(width: .infinity, height: .infinity)
            }
            
            if isLocked {
                HStack {
                    Image("lock").frame(width: 30, height: 28).padding(
                        .leading, 15)
                    
                    Text("Libera em 10d 08h").colorMultiply(
                        isLocked ? Color.white : Color.black
                    )
                    .font(.system(size: 20))
                    .font(.body)
                    .bold()
                    .fontWeight(.regular)
                    .foregroundStyle(Color.white)
                    .padding(.leading, 7)
                }
                //            } else
                //            if isChecked{
                //                HStack{
                //                    Text("\(challengerNumber)").colorMultiply(Color.white
                //                    )
                //                    .font(.system(size: 20))
                //                    .font(.body)
                //                    .bold()
                //                    .fontWeight(.regular)
                //                    .foregroundStyle(Color.white)
                //                    .padding(.leading, 15)
                //                    Text(challenger).colorMultiply(Color.white
                //                    )
                //                    .font(.system(size: 15))
                //                    .font(.body)
                //                    .bold()
                //                    .fontWeight(.regular)
                //                    .foregroundStyle(Color.white)
                //                    .padding(.leading, 7)
                //                }
            } else {
                HStack {
                    Text("\(challengerNumber)").colorMultiply(
                        isChecked ? Color.white : Color.black
                    )
                    .font(.system(size: 20))
                    .font(.body)
                    .bold()
                    .fontWeight(.regular)
                    .foregroundStyle(Color.white)
                    .padding(.leading, 15)
                    
                    Text(challenger).colorMultiply(
                        isChecked ? Color.white : Color.black
                    )
                    .font(.system(size: 15))
                    .font(.body)
                    .bold()
                    .fontWeight(.regular)
                    .foregroundStyle(Color.white)
                    .padding(.leading, 7)
                    
                    Spacer()
                    
                    Button(action: {
                        isChecked.toggle()
                    }) {
                        Image(
                            systemName: isChecked
                            ? "checkmark.circle.fill" : "circle"
                        )
                        .foregroundColor(.black)
                        .font(.system(size: 25))
                        
                    }
                }
            }
            
        }
    }
}

#Preview {
    ChallengerCard(
        challengerNumber: 01, challenger: "Leia um livro em um mês",
        color: "challengers", lockedColor: "black", isLocked: false, isChecked: .constant(false))
}

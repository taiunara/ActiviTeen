//
//  WriteSongView.swift
//  ActivTeen
//
//  Created by found on 21/03/25.
//

import SwiftUI
import SwiftData


@Model
class Song {
    var text: String
    
    init(text: String) {
        self.text = text
    }
}

struct WriteSongView: View {
    
    var descriptionTitle: String
    var descriptionSubtitle: String?
    
    @Binding var text: String
    
    var body: some View {
        
        VStack {
            
            HStack {
                Text(descriptionTitle)
                    .font(.title)
                    .bold()
               
                
            } .padding()
            
            HStack{
                if let descriptionSubtitle = descriptionSubtitle {
                    Text(descriptionSubtitle)
                        .font(.subheadline)
                }
            }
            
            
            Form {
                Section {
                    ZStack (alignment: .bottomLeading){
                        TextField("Digite aqui...", text: $text, axis: .vertical)
                            .textFieldStyle(.plain)
                            .frame(height: 200, alignment: .top)
                    }
                }
            }
            .scrollContentBackground(.hidden)
        }
    } 
}

#Preview {
    WriteSongView(
        descriptionTitle: "Escreva uma música curta sobre o seu dia em até 30 palavras",
        text: .constant("")
    )
}


////
////  WriteSongView.swift
////  ActivTeen
////
////  Created by found on 21/03/25.
////
//
//import SwiftUI
//
//struct WriteSongView: View {
//    
//    var descriptionTitle: String
//    
//    @State private var text: String = ""
//    
//    var body: some View {
//        
//        HStack {
//            Text(descriptionTitle)
//                .font(.title)
//                .bold()
//        }
//        .padding()
//        
//        Form {
//            Section {
//                ZStack (alignment: .bottomLeading){
//                    TextField("Digite aqui...", text: $text, axis: .vertical)
//                        .textFieldStyle(.plain)
//                       .frame(height: 200, alignment: .top)
//                }
//            }
//        }
//        .scrollContentBackground(.hidden)
//    }
//}
//
//#Preview {
//    WriteSongView(descriptionTitle: "Escreva uma música curta sobre o seu dia em até 30 palavras")
//}

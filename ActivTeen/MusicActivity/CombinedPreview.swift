import SwiftUI
import SwiftData

struct CombinedPreview: View {
    var body: some View {
        
        VStack(spacing: -15) {
            
    
            HStack{
                ActivitiesView()
            }
                
        } .ignoresSafeArea()
    }
    
}


#Preview {
    CombinedPreview()
    .modelContainer(for: Song.self, inMemory: true)
}

//
//  ActivitiesView.swift
//  ActivTeen
//
//  Created by found on 20/03/25.
//

import SwiftUI
import SwiftData

@Model
class Activity: Identifiable {
    var text: String
    var isCompleted: Bool
    var task: String
    var answer: String = ""
    var isTrack : Bool = false
    
    init(text: String, isCompleted: Bool, task: String) {
        self.text = text
        self.isCompleted = isCompleted
        self.task = task
        self.isTrack = false
    }
    
}

struct ActivitiesView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query(sort: \Activity.text)
    private var activities: [Activity]
    
    var progress: Double {
        let completedCount = activities.filter { $0.isCompleted }.count
        return Double(completedCount) / Double(activities.count)
    }
    
    var body: some View {
        VStack(spacing: -16) {
            
            HStack{
                TittleActivitiesView(titleActivities: "Música", subTittleActivities: "Realize as atividades e bata sua meta diária", imageActivities: "musicHeader", colorHeader: Color.purpleTest)}
            
            HStack {
                if activities.count > 0 {
                    ProgressBarView(progress: .constant(progress), colorBar: Color.darkPurple)
                }
            }
            
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                ForEach(activities) { activity in
                    @Bindable var activity = activity
                    NavigationLink {
                        WriteSongView(descriptionTitle: activity.task, text: $activity.answer)
                    } label: {
                        ActivityCardView(
                            isCompleted: $activity.isCompleted,
                            text: activity.text,
                            color1: .purpleTest,
                            color2: .darkPurple,
                            textColor: activity.isCompleted ? .white : .black
                        )
                        .cardSquare()
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding()
        } .ignoresSafeArea()
        .onAppear {
            if activities.count == 0 {
                
                let all = [
                    Activity(
                        text: "Escreva uma música curta sobre o seu dia em até 30 palavras",
                        isCompleted: false,
                        task:  "Escreva uma música curta sobre o seu dia em até 30 palavras"
                    ),
                    Activity(
                        text: "Crie uma playlist com 10 músicas que reflitam seu humor hoje",
                        isCompleted: false,
                        task: "Crie uma playlist com 10 músicas que reflitam seu humor hoje"
                    ),
                    Activity(
                        text: "Liste seu Top 5 de músicas favoritas do momento",
                        isCompleted: false,
                        task: "Liste seu Top 5 de músicas favoritas do momento"
                    ),
                    Activity(
                        text: "Crie uma paródia simples de uma música favorita",
                        isCompleted: false,
                        task: "Crie uma paródia simples de uma música favorita"
                    )
                ]
                
                for activity in all {
                    modelContext.insert(activity)
                }
                
            }
        }
    }
}

#Preview {
    NavigationStack {
        ActivitiesView()
    }
    .modelContainer(for: Activity.self, inMemory: false)
}




//
//  ActivitiesBookView.swift
//  ActivTeen
//

import SwiftUI
import SwiftData

@Model
class ActivityBook: Identifiable {
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

struct ActivitiesBookView: View {
    
    @Environment(\.modelContext) var modelContext
    
    @Query(sort: \ActivityBook.text)
//    // Filtra apenas atividades relacionadas a livros
//    @Query(filter: #Predicate<ActivityBook> { activity in
//        activity.task.localizedStandardContains("livro") ||
//        activity.task.localizedStandardContains("leitura") ||
//        activity.task.localizedStandardContains("ler") ||
//        activity.task.localizedStandardContains("capítulo") ||
//        activity.task.localizedStandardContains("literário")
//    })
    private var activities: [ActivityBook]
    
    var progress: Double {
        let completedCount = activities.filter { $0.isCompleted }.count
        return activities.isEmpty ? 0 : Double(completedCount) / Double(activities.count)
    }
    
    var body: some View {
        VStack(spacing: -16) {
            
            HStack {
                TittleActivitiesView(
                    titleActivities: "Leitura",
                    subTittleActivities: "Realize as atividades e bata sua meta semanal",
                    imageActivities: "booksHeader",
                    colorHeader: Color.greenTest
                )
            }
            
            HStack {
                if !activities.isEmpty {
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
                            color1: .greenTest,
                            color2: .darkPurple,
                            textColor: activity.isCompleted ? .white : .black
                        )
                        .cardSquare()
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding()
        }
        .ignoresSafeArea()
        .onAppear {
            if activities.isEmpty {
                let bookActivities = [
                    ActivityBook(
                        text: "Leia um capítulo de um livro e escreva sua citação favorita.",
                        isCompleted: false,
                        task: "Leia um capítulo de um livro e escreva sua citação favorita."
                    ),
                    ActivityBook(
                        text: "Descreva uma cena de um livro que você gostaria de ver em um filme.",
                        isCompleted: false,
                        task: "Descreva uma cena de um livro que você gostaria de ver em um filme."
                    ),
                    ActivityBook(
                        text: "Liste 5 personagens literários com quem você se identifica.",
                        isCompleted: false,
                        task: "Liste 5 personagens literários com quem você se identifica."
                    ),
                    ActivityBook(
                        text: "Escreva um final alternativo para um livro que você leu",
                        isCompleted: false,
                        task: "Escreva um final alternativo para um livro que você leu"
                    )
                ]
                
                for activity in bookActivities {
                    modelContext.insert(activity)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        ActivitiesBookView()
    }
    .modelContainer(for: ActivityBook.self, inMemory: true)
}

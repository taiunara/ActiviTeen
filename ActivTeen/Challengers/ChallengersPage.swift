//
//  SwiftUIView.swift
//  ActivTeen
//
//  Created by user on 24/03/25.
//

import SwiftData
import SwiftUI

@Model
class Challenge: Identifiable {
    var challengerNumber: Int
    var text: String
    //    var descriptionChallenger: String
    var isCompleted: Bool
    var task: String
    var isLocked: Bool
    var answer: String = ""

    init(
        challengerNumber: Int, text: String, isCompleted: Bool, task: String,
        isLocked: Bool
    ) {
        self.challengerNumber = challengerNumber
        self.text = text
        //        self.descriptionChallenger = descriptionChallenger
        self.isCompleted = isCompleted
        self.task = task
        self.isLocked = isLocked
    }

}

struct ChallengersPage: View {

    @Environment(\.modelContext) var modelContext

    @Query(sort: \Challenge.challengerNumber)
    private var challenges: [Challenge]

    var progress: Double {
        let completedCount = challenges.filter { $0.isCompleted }.count
        return Double(completedCount) / Double(challenges.count)
    }
    
    var body: some View {
        VStack {
            TittleActivitiesView(
                titleActivities: "Desafios",
                subTittleActivities:
                    "Realize as atividades e cumpra o desafio mensal ",
                imageActivities: "", colorHeader: Color.greenTest)
            
            if challenges.count > 0 {
                ProgressBarView(progress: .constant(progress), colorBar: Color.darkgreenTest)
            }
            
            VStack(spacing: 16) {
                ForEach(challenges) { challenge in
                    @Bindable var challenge = challenge
                    NavigationLink {
                        if challenge.isLocked {

                        } else {
                            WriteSongView(
                                descriptionTitle: challenge.text,
                                text: $challenge.answer)
                        }

                    } label: {
                        ChallengerCard(
                            challengerNumber: challenge.challengerNumber,
                            challenger: challenge.text,
                            color: "challengers", lockedColor: "black",
                            isLocked: challenge.isLocked,
                            isChecked: $challenge.isCompleted
                        ).challengerCard()
                    }
                }

                //                ChallengerCard(
                //                    challengerNumber: 02,
                //                    challenger:
                //                        "Crie uma trilha sonora com 15 músicas para o livro que você está lendo",
                //                    color: "challengers", lockedColor: "black", isLocked: false
                //                ).challengerCard()
                //                ChallengerCard(
                //                    challengerNumber: 03,
                //                    challenger:
                //                        "Crie um albúm com 20 fotos de ambientes e objetos que se encaixam em seu livro",
                //                    color: "challengers", lockedColor: "black", isLocked: false
                //                ).challengerCard()
                //                ChallengerCard(
                //                    challengerNumber: 04, challenger: "Leia um livro em um mês",
                //                    color: "challengers", lockedColor: "black", isLocked: true
                //                ).challengerCard()
            }
        }.ignoresSafeArea()

            .onAppear {
                if challenges.count == 0 {

                    let all = [
                        Challenge(
                            challengerNumber: 1,
                            text: "Leia um livro em um mês",
                            isCompleted: false,
                            task: "Qual livro você está lendo?",
                            isLocked: false
                        ),
                        Challenge(
                            challengerNumber: 2,
                            text:
                                "Crie uma trilha sonora com 15 músicas para o livro que você está lendo",
                            isCompleted: false,
                            task:
                                "Crie uma trilha sonora com 15 músicas para o livro que você est;a lendo",
                            isLocked: false
                        ),
                        Challenge(
                            challengerNumber: 3,
                            text:
                                "Crie um albúm com 20 fotos de ambientes e objetos que se encaixam em seu livro",
                            isCompleted: false,
                            task:
                                "Crie um albúm com 20 fotos de ambientes e objetos que se encaixam em seu livro",
                            isLocked: false
                        ),
                        Challenge(
                            challengerNumber: 4,
                            text:
                                "Crie uma paródia simples de uma música favorita",
                            isCompleted: false,
                            task:
                                "Crie uma paródia simples de uma música favorita",
                            isLocked: true

                        ),
                    ]

                    for challenge in all {
                        modelContext.insert(challenge)
                    }

                }
            }
    }
}

#Preview {
    ChallengersPage().modelContainer(
        for: Challenge.self, inMemory: false)
}

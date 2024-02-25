//
//  ChallengeHintView.swift
//  
//
//  Created by Jia Chen Yee on 18/2/24.
//

import SwiftUI

struct ChallengeHintView: View {
    
    @EnvironmentObject var challengeViewModel: ChallengeViewModel
    @EnvironmentObject var viewModel: ViewModel
    @EnvironmentObject var challengePersistenceViewModel: ChallengePersistenceViewModel
    
    @AppStorage("hotChocolates") private var hotChocolates = 10
    
    var body: some View {
        VStack {
            let color = challengeViewModel.challenge.category.color
            
            HStack {
                Text("\(hotChocolates)")
                    .contentTransition(.numericText())
                HotChocolateAnimatingIconView()
            }
            .font(.largeTitle)
            .fontWeight(.bold)
            
            Text("Hot chocolate mugs are required to unlock hints. You can earn hot chocolate mugs by solving challenges.")
                .multilineTextAlignment(.center)
                .padding(.bottom)
            
            if let hint = challengeViewModel.challenge.hint {
                HintRowView(hotChocolates: $hotChocolates, hint: hint.hint1, 
                            value: 1,
                            color: color)
                HintRowView(hotChocolates: $hotChocolates, hint: hint.hint2, 
                            value: 2,
                            color: color)
                HintRowView(hotChocolates: $hotChocolates, hint: hint.hint3,
                            value: 3,
                            color: color)
            }
            
            MenuDismissButton(isLabelShown: .constant(false),
                              color: color) {
                withAnimation {
                    challengeViewModel.state = .playing(false)
                }
            }
            .padding(.top)
        }
        .frame(maxWidth: 800, alignment: .leading)
    }
}

struct HintRowView: View {
    
    @EnvironmentObject var challengeViewModel: ChallengeViewModel
    @EnvironmentObject var challengePersistenceViewModel: ChallengePersistenceViewModel
    @Binding var hotChocolates: Int
    
    var hint: String
    var value: Int
    
    var color: Color
    
    var body: some View {
        HStack {
            let unlockedHints = challengePersistenceViewModel.retrieveChallenge(challengeViewModel.challenge).unlockedHints
            
            if unlockedHints >= value {
                Text(hint)
                    .multilineTextAlignment(.leading)
                    .font(.title3)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(color.opacity(0.3))
            } else if unlockedHints == value - 1 {
                Button {
                    withAnimation {
                        hotChocolates -= value
                        
                        var retrievedChallenge = challengePersistenceViewModel.retrieveChallenge(challengeViewModel.challenge)
                        retrievedChallenge.unlockedHints = value
                        challengePersistenceViewModel.challengeData[retrievedChallenge.feature] = retrievedChallenge
                    }
                } label: {
                    ZStack {
                        Text(hint)
                            .redacted(reason: .placeholder)
                            .multilineTextAlignment(.leading)
                            .font(.title3)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .blur(radius: 8)
                        
                        if hotChocolates >= value {
                            HStack {
                                Text("Unlock with \(value)")
                                HotChocolateAnimatingIconView()
                            }
                        } else {
                            HStack {
                                Text("Insufficient Hot Chocolate. You need \(value - hotChocolates)")
                                HotChocolateAnimatingIconView()
                                Text("more.")
                            }
                        }
                    }
                    .background(.thickMaterial)
                    .foregroundStyle(.white)
                    .disabled(hotChocolates < value)
                }
            } else {
                ZStack {
                    Image(systemName: "lock.fill")
                    
                    Text(hint)
                        .redacted(reason: .placeholder)
                        .multilineTextAlignment(.leading)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .blur(radius: 8)
                }
                .font(.title3)
                .background(.thickMaterial)
                .foregroundStyle(.white)
                .disabled(hotChocolates < value)
            }
        }
        .clipShape(.rect(cornerRadius: 8))
    }
}

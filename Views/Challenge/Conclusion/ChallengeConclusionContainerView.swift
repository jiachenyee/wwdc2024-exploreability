//
//  ChallengeConclusionContainerView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 4/2/24.
//

import Foundation
import SwiftUI

struct ChallengeConclusionContainerView<Content: View>: View {
    
    @AppStorage("hotChocolates") private var hotChocolates = 10
    
    @EnvironmentObject var challengePersistenceViewModel: ChallengePersistenceViewModel
    @EnvironmentObject var challengeViewModel: ChallengeViewModel
    
    var namespace: Namespace.ID
    var challenge: Challenge
    
    @State private var newSolve = true
    @State private var renderedImage = Image(systemName: "photo")
    
    @ViewBuilder
    var content: (() -> Content)
    
    var onDismiss: (() -> Void)
    
    var body: some View {
        VStack {
            ZStack {
                VStack {
                    ZStack {
                        Circle()
                            .fill(challenge.color)
                            .frame(width: 48, height: 48)
                            .shadow(radius: 8)
                        challenge.image
                            .matchedGeometryEffect(id: challenge.feature, in: namespace)
                    }
                    
                    Text(challenge.feature)
                        .font(.title)
                        .multilineTextAlignment(.center)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding([.top, .horizontal], 20)
                    
                    Text(challengePersistenceViewModel.retrieveChallenge(challenge).solveDate ?? .now,
                         style: .date)
                        .font(.caption)
                }
                .padding()
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                .background {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(challenge.color.opacity(0.5))
                            .matchedGeometryEffect(id: challenge.feature + ".frame", in: namespace)
                        GeometryReader { proxy in
                            ConfettiView(size: proxy.size)
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                    }
                    .ignoresSafeArea(.container, edges: .top)
                }
                .overlay {
                    ShareLink("", item: renderedImage,
                              preview: SharePreview(Text("\(challenge.feature) Award"),
                                                    image: renderedImage))
                    .imageScale(.large)
                    .padding(.trailing)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                }
            }
            
            if newSolve {
                HStack {
                    HotChocolateAnimatingIconView()
                        .font(.system(size: 32))
                    
                    VStack(alignment: .leading) {
                        Text("You earned 5 mugs of Hot Chocolate!")
                            .font(.headline)
                        Text("Hot chocolate mugs can be redeemed for challenge hints!")
                            .font(.body)
                    }
                    .padding(.leading, 4)
                }
                .padding()
                .frame(maxWidth: 800, alignment: .leading)
                .background {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(.thickMaterial)
                }
                .padding(.top)
            }
            
            ScrollView {
                VStack(alignment: .leading) {
                    content()
                }
                .padding()
                .frame(maxWidth: 800, alignment: .leading)
                .frame(maxWidth: .infinity)
            }
            
            Button {
                withAnimation(.bouncy) {
                    challengeViewModel.state = .playing(false)
                }
            } label: {
                Text("Play Again")
                    .padding(8)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderless)
            .padding(.horizontal)
            .frame(maxWidth: 800)
            
            Button {
                onDismiss()
            } label: {
                Text("Done")
                    .padding(8)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .padding([.horizontal, .bottom])
            .frame(maxWidth: 800)
        }
        .onAppear {
            var challengeData = challengePersistenceViewModel.retrieveChallenge(challenge)
            
            if challengeData.solveDate == nil {
                challengeData.solveDate = .now
                newSolve = true
            } else {
                newSolve = false
            }
            
            challengePersistenceViewModel.challengeData[challenge.feature] = challengeData
            
            render(date: challengeData.solveDate!)
        }
        .onDisappear {
            if newSolve {
                Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { _ in
                    withAnimation {
                        hotChocolates += 5
                    }
                }
            }
        }
    }
    
    @MainActor func render(date: Date) {
        let renderer = ImageRenderer(content: AwardExportView(challenge: challengeViewModel.challenge,
                                                              date: date))
        
        renderer.proposedSize = .init(width: 1200, height: 1200)
        
        if let uiImage = renderer.uiImage {
            
            renderedImage = Image(uiImage: uiImage)
        }
    }
}

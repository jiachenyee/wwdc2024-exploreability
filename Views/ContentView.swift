//
//  ContentView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 3/2/24.
//

import SwiftUI
import UIKit

struct ContentView: View {
    
    @Namespace var namespace
    
    @State private var shownHexagons = 0
    
    @StateObject var viewModel = ViewModel()
    @StateObject var challengePersistenceViewModel = ChallengePersistenceViewModel()
    
    @AppStorage("ShowOnboarding") private var showOnboarding = true
    
    var body: some View {
        ZStack {
            switch viewModel.gameState {
            case .home:
                HomeView(shownHexagons: $shownHexagons)
            case .challenge(let challenge):
                ChallengeView(challenge: challenge)
            }
        }
        .onAppear {
            viewModel.sharedNamespace = namespace
        }
        .environmentObject(viewModel)
        .environmentObject(challengePersistenceViewModel)
        .sheet(isPresented: $showOnboarding) {
            OnboardingView()
                .preferredColorScheme(.dark)
                .onDisappear {
                    showOnboarding = false
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}

//
//  ControlsHexagonView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 7/2/24.
//

import Foundation
import SwiftUI

struct ControlsHexagonView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    @State private var isOnboardingPresented = false
    @State private var isSettingsPresented = false
    @State private var isCafePresented = false
    
    var body: some View {
        ZStack {
            HStack(spacing: 16) {
                VStack(spacing: 21) {
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundStyle(.white.opacity(0.05))
                    
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundStyle(.white.opacity(0.05))
                }
                
                VStack(spacing: 21) {
                    HomeViewActionButton(systemName: "mug.fill", color: .yellow) {
                        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                        isCafePresented.toggle()
                    }
                    .sheet(isPresented: $isCafePresented) {
                        RewardCafeView()
                            .presentationDetents([.medium, .large])
                    }
                    
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundStyle(.white.opacity(0.1))
                        .overlay {
                            Image(systemName: "house")
                                .font(.system(size: 25))
                                .foregroundStyle(.yellow)
                        }
                    
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundStyle(.white.opacity(0.05))
                }
                VStack(spacing: 21) {
                    HomeViewActionButton(systemName: "heart.fill", color: .yellow.opacity(0.9)) {
                        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                        isOnboardingPresented.toggle()
                    }
                    .sheet(isPresented: $isOnboardingPresented) {
                        OnboardingView()
                    }
                    
                    HomeViewActionButton(systemName: "switch.2", color: .yellow.opacity(0.7)) {
                        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                        isSettingsPresented.toggle()
                    }
                    .sheet(isPresented: $isSettingsPresented) {
                        SettingsView()
                    }
                }
            }
            .imageScale(.large)
            
            .padding(32)
            .overlay {
                LinearGradient(colors: [.yellow, .yellow.opacity(0.5)],
                               startPoint: .topLeading, endPoint: .bottomTrailing)
                .mask {
                    Image("hex")
                        .resizable()
                        .scaledToFit()
                }
                .allowsHitTesting(false)
            }
            .padding(-32)
        }
    }
}

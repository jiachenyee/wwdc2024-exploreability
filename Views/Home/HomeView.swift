//
//  HomeView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 7/2/24.
//

import Foundation
import SwiftUI

struct HomeView: View {
    
    @Binding var shownHexagons: Int
    
    var body: some View {
        ZStack {
            ZStack {
                Color.black
                
                VStack(spacing: 21) {
                    HStack(spacing: 64) {
                        HexagonView(challengeCategory: .vision, isPresented: shownHexagons >= 1)
                        HexagonView(challengeCategory: .hearing, isPresented: shownHexagons >= 2)
                    }
                    if shownHexagons >= 0 {
                        ControlsHexagonView()
                    }
                    HStack(spacing: 64) {
                        HexagonView(challengeCategory: .mobility, isPresented: shownHexagons >= 3)
                        HexagonView(challengeCategory: .cognitive, isPresented: shownHexagons >= 4)
                    }
                }
            }
            .foregroundStyle(.white)
            .onAppear {
                guard shownHexagons == 0 else { return }
                Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
                    withAnimation {
                        shownHexagons += 1
                    }
                    if shownHexagons == 4 {
                        timer.invalidate()
                    }
                }
            }
            
            HotChocolateIndicatorView()
        }
    }
}

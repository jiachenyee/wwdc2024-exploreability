//
//  OnboardingTitleCard.swift
//
//
//  Created by Jia Chen Yee on 25/2/24.
//

import SwiftUI

struct OnboardingTitleCard: View {
    
    @State private var angle = Angle.degrees(0)
    @State private var isShown = false
    @State private var isCombined = false
    @State private var isWordsShown = false
    @State private var isAUppercased = true
    
    var body: some View {
        VStack(alignment: .center) {
            ZStack {
                Image("ExploreAbilityIconCircle")
                    .resizable()
                    .scaledToFill()
                    .rotationEffect(angle)
                    .frame(width: 128, height: 128)
                    .mask {
                        Image(systemName: "hexagon.fill")
                            .resizable()
                            .scaledToFit()
                    }
                    .clipped()
                Image(systemName: "hexagon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 128, height: 128)
            }
            .frame(maxWidth: .infinity)
            .padding()
            
            HStack(spacing: 0) {
                Text("Explore")
                
                if !isWordsShown {
                    Spacer()
                }
                
                Text("A")
                if !isWordsShown {
                    Text("ccessi")
                }
                
                Text("bility")
            }
            .font(.largeTitle)
            .fontWeight(.bold)
            .frame(maxWidth: .infinity)
            .opacity(isShown ? 1 : 0)
            
            Text("A unique way to explore iPad accessibility features.")
                .font(.title3)
                .fontWeight(.medium)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .onAppear {
            withAnimation(.linear(duration: 10).repeatForever(autoreverses: false)) {
                angle = .degrees(360)
            }
            
            withAnimation {
                isShown = true
            }
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { _ in
                withAnimation(.snappy) {
                    isCombined = true
                }
                withAnimation(.easeInOut(duration: 0.3)) {
                    isWordsShown = true
                }
                Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false) { _ in
                    isAUppercased = false
                }
            }
        }
    }
}

#Preview {
    OnboardingTitleCard()
}

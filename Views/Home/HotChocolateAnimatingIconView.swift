//
//  HotChocolateAnimatingIconView.swift
//
//
//  Created by Jia Chen Yee on 18/2/24.
//

import Foundation
import SwiftUI

struct HotChocolateAnimatingIconView: View {
    
    @State private var mugAnimationAngle = Angle.degrees(0)
    
    var body: some View {
        ZStack {
            Image(systemName: "mug.fill")
            
            Image(systemName: "mug.fill")
                .foregroundStyle(.brown)
                .clipShape(WaveView(offset: mugAnimationAngle, percent: 0.5))
                .onAppear {
                    Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { _ in
                        withAnimation(.linear(duration: 3).repeatForever(autoreverses: false)) {
                            mugAnimationAngle = .degrees(360)
                        }
                    }
                }
        }
        .accessibilityHidden(true)
    }
}

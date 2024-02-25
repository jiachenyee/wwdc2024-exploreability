//
//  HotChocolateIndicatorView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 10/2/24.
//

import Foundation
import SwiftUI

struct HotChocolateIndicatorView: View {
    
    @AppStorage("hotChocolates") private var hotChocolates = 10
    @State private var isCafePresented = false
    
    var body: some View {
        Button {
            isCafePresented.toggle()
        } label: {
            HStack {
                Text("\(hotChocolates)")
                    .contentTransition(.numericText())
                HotChocolateAnimatingIconView()
            }
            .foregroundStyle(.white)
            .padding()
            .background(.ultraThickMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        .padding([.trailing, .top])
        .sheet(isPresented: $isCafePresented) {
            RewardCafeView()
                .presentationDetents([.medium, .large])
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
    }
}

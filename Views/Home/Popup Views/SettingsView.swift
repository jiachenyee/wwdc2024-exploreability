//
//  SettingsView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 7/2/24.
//

import Foundation
import SwiftUI

struct SettingsView: View {
    
    @State private var isResetAllDataPresented = false
    
    @EnvironmentObject var challengePersistenceViewModel: ChallengePersistenceViewModel
    @EnvironmentObject var viewModel: ViewModel
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    Button(role: .destructive) {
                        isResetAllDataPresented.toggle()
                    } label: {
                        Label {
                            Text("Reset All Data")
                        } icon: {
                            Image(systemName: "trash")
                                .foregroundStyle(.red)
                        }

                    }
                }
                .alert("Reset All Data", isPresented: $isResetAllDataPresented) {
                    Button(role: .destructive) {
                        challengePersistenceViewModel.nuke()
                    } label: {
                        Text("Reset All Data")
                    }
                    
                    Button(role: .cancel) {
                        
                    } label: {
                        Text("Cancel")
                    }
                } message: {
                    Text("You will lose all challenge progress, hints, Game Center achievements, and any achievements. This is irreversible.")
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }
                }
            }
            .navigationTitle("Settings")
        }
    }
}

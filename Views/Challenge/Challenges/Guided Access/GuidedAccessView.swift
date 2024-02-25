//
//  GuidedAccessView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 25/2/24.
//

import SwiftUI

struct GuidedAccessView: View {
    
    var isFeatureToggled: Bool
    
    @EnvironmentObject var challengeViewModel: ChallengeViewModel
    @EnvironmentObject var viewModel: ViewModel
    
    @State private var interfaceOrientation: InterfaceOrientation = .portrait
    
    private let interfaceOrientationPublisher = NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)
    private let publisher = NotificationCenter.default.publisher(for: UIAccessibility.guidedAccessStatusDidChangeNotification)
    
    @State private var isGuidedAccessEnabled = UIAccessibility.isGuidedAccessEnabled
    
    @State private var didSucceed = false
    @State private var locked = false
    
    var body: some View {
        Group {
            if !isFeatureToggled {
                ZStack {
                    if hasHomeButton() {
                        switch interfaceOrientation {
                        case .landscapeLeft:
                            Image(systemName: locked ? "lock" : "lock.open")
                                .padding(.top, 32)
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                            
                            Image(systemName: locked ? "lock" : "lock.open")
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
                        case .landscapeRight:
                            Image(systemName: locked ? "lock" : "lock.open")
                                .padding(.bottom, 32)
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                            
                            Image(systemName: locked ? "lock" : "lock.open")
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                        case .portrait:
                            Image(systemName: locked ? "lock" : "lock.open")
                                .padding()
                                .padding(.trailing, 16)
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                            
                            Image(systemName: locked ? "lock" : "lock.open")
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                        case .portraitUpsideDown:
                            Image(systemName: locked ? "lock" : "lock.open")
                                .padding()
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                            
                            Image(systemName: locked ? "lock" : "lock.open")
                                .padding(.leading, 32)
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                        }
                    } else {
                        Image(systemName: locked ? "lock" : "lock.open")
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                        switch interfaceOrientation {
                        case .landscapeLeft:
                            Image(systemName: locked ? "lock" : "lock.open")
                                .padding(.top, 32)
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                        case .landscapeRight:
                            Image(systemName: locked ? "lock" : "lock.open")
                                .padding(.bottom, 32)
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                        case .portrait:
                            Image(systemName: locked ? "lock" : "lock.open")
                                .padding()
                                .padding(.trailing, 16)
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                        case .portraitUpsideDown:
                            Image(systemName: locked ? "lock" : "lock.open")
                                .padding()
                                .padding(.leading, 16)
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                        }
                    }
                    
                    ChallengeHomeButton()
                }
                .onChange(of: isGuidedAccessEnabled) { newValue in
                    guard newValue else { return }
                    withAnimation {
                        locked = true
                    }
                    
                    Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
                        withAnimation {
                            challengeViewModel.state = .playing(true)
                        }
                    }
                }
            } else {
                PlayingFeatureOnView(initialState: false, didSucceed: $didSucceed)
                    .onChange(of: isGuidedAccessEnabled) { newValue in
                        guard !newValue else { return }
                        
                        withAnimation {
                            didSucceed = true
                        }
                    }
            }
        }
        .onReceive(publisher) { _ in
            isGuidedAccessEnabled = UIAccessibility.isGuidedAccessEnabled
        }
        .onReceive(interfaceOrientationPublisher) { _ in
            updateOrientation()
        }
        .onAppear {
            isGuidedAccessEnabled = UIAccessibility.isGuidedAccessEnabled
            UIDevice.current.beginGeneratingDeviceOrientationNotifications()
            updateOrientation()
        }
        .onDisappear {
            UIDevice.current.endGeneratingDeviceOrientationNotifications()
        }
    }
    
    func updateOrientation() {
        let newInterfaceOrientation: InterfaceOrientation? = switch UIDevice.current.orientation {
        case .portrait: .portrait
        case .landscapeLeft: .landscapeLeft
        case .landscapeRight: .landscapeRight
        case .portraitUpsideDown: .portraitUpsideDown
        default: nil
        }
        
        if let newInterfaceOrientation {
            interfaceOrientation = newInterfaceOrientation
        }
    }
    
    func hasHomeButton() -> Bool {
        guard let windowScene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive && $0 is UIWindowScene })
            as? UIWindowScene,
              let keyWindow = windowScene.windows.filter({$0.isKeyWindow}).first else { return false }
        
        return keyWindow.safeAreaInsets.bottom <= 0
    }
    
    func isIPadMini6Gen() -> Bool {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        return identifier == "iPad14,1" || identifier == "iPad14,2"
    }
}

enum InterfaceOrientation {
    case landscapeLeft
    case landscapeRight
    case portrait
    case portraitUpsideDown
}

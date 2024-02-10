//
//  LoginContentView.swift
//  TCA-Demo
//
//  Created by Telem Tobi on 10/02/2024.
//

import SwiftUI
import ComposableArchitecture

extension LoginNavigator {
    struct ContentView: UIViewControllerRepresentable {
        
        let store: StoreOf<LoginNavigator>
        
        func makeUIViewController(context: Context) -> UINavigationController {
            let navigationController = UINavigationController(
                rootViewController: LoginViewController()
            )
            navigationController.navigationBar.prefersLargeTitles = true
            return navigationController
        }
        
        func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
            
        }
    }
}

#Preview {
    LoginNavigator.ContentView(
        store: .init(
            initialState: LoginNavigator.State(),
            reducer: LoginNavigator.init
        )
    )
}

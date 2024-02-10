//
//  RootNavigator.swift
//  TCA-Demo
//
//  Created by Telem Tobi on 09/02/2024.
//

import Foundation
import ComposableArchitecture

@Reducer
struct RootNavigator {
    
    @ObservableState
    struct State: Equatable {
        var presentation: Presentation.State = .splash(SplashReducer.State())
    }
    
    enum Action {
        case presentation(Presentation.Action)
    }
    
    var body: some ReducerOf<Self> {
        Scope(state: \.presentation, action: \.presentation, child: Presentation.init)
        
        Reduce { state, action in
            switch action {
            case .presentation(.splash(.splashCompleted)):
                state.presentation = .login(LoginNavigator.State())
                return .none
                
            case .presentation(.login(.loginCompleted)):
                state.presentation = .home(HomeNavigator.State())
                return .none
                
            case .presentation:
                return .none
            }
        }
    }
}

extension RootNavigator {
    
    @Reducer
    struct Presentation {
        
        @ObservableState
        enum State: Equatable {
            case splash(SplashReducer.State)
            case login(LoginNavigator.State)
            case home(HomeNavigator.State)
        }
        
        enum Action {
            case splash(SplashReducer.Action)
            case login(LoginNavigator.Action)
            case home(HomeNavigator.Action)
        }
        
        var body: some ReducerOf<Self> {
            Scope(state: \.splash, action: \.splash, child: SplashReducer.init)
            Scope(state: \.login, action: \.login, child: LoginNavigator.init)
            Scope(state: \.home, action: \.home, child: HomeNavigator.init)
        }
    }
}

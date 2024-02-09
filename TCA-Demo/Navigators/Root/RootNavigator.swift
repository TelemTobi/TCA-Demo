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
        Reduce { state, action in
            switch action {
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
            case login
            case home
        }
        
        enum Action {
            case splash(SplashReducer.Action)
            case login
            case home
        }
        
        var body: some ReducerOf<Self> {
            Scope(state: \.splash, action: \.splash, child: SplashReducer.init)
        }
    }
}

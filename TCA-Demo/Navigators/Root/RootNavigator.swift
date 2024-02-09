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
        @Presents var presentation: Presentation.State = .splash
    }
    
    enum Action {
        case presentation(PresentationAction<Presentation.Action>)
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
            case splash
            case login
            case home
        }
        
        enum Action {
            case splash
            case login
            case home
        }
        
        var body: some ReducerOf<Self> {
            
        }
    }
}

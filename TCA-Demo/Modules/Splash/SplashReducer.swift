//
//  SplashReducer.swift
//  TCA-Demo
//
//  Created by Telem Tobi on 09/02/2024.
//

import Foundation
import ComposableArchitecture

@Reducer
struct SplashReducer {
    
    @ObservableState
    struct State: Equatable {
        
    }
    
    enum Action {
        case onAppear
        case splashCompleted
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                return .run { send in
                    try? await Task.sleep(for: .seconds(2))
                    await send(.splashCompleted)
                }
                
            // MARK: Navigation actions
            case .splashCompleted:
                return .none
            }
        }
    }
}

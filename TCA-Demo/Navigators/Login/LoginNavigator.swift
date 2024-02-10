//
//  LoginNavigator.swift
//  TCA-Demo
//
//  Created by Telem Tobi on 10/02/2024.
//

import Foundation
import ComposableArchitecture

@Reducer
struct LoginNavigator {
    
    @ObservableState
    struct State: Equatable {
        
    }
    
    enum Action {
        case loginCompleted
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            
            // MARK: Navigation actions
            case .loginCompleted:
                return .none
            }
        }
    }
}

//
//  ReasonReducer.swift
//  TCA-Demo
//
//  Created by Telem Tobi on 07/02/2024.
//

import Foundation
import ComposableArchitecture

@Reducer
struct ReasonReducer {
    
    @ObservableState
    struct State: Equatable {
        
    }
    
    enum Action {
        case didSelectReason(String)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            // Navigation actions are handled in the parent Navigator reducer
            case .didSelectReason:
                return .none
            }
        }
    }
}

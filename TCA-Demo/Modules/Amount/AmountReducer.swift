//
//  AmountReducer.swift
//  TCA-Demo
//
//  Created by Telem Tobi on 06/02/2024.
//

import Foundation
import ComposableArchitecture

@Reducer
struct AmountReducer {
    
    @ObservableState
    struct State: Equatable {
        
    }
    
    enum Action {
        case didSelectAmount(Float)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            // Navigation actions are handled in the parent Navigator reducer
            case .didSelectAmount:
                return .none
            }
        }
    }
}


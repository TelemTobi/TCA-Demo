//
//  HomeReducer.swift
//  TCA-Demo
//
//  Created by Telem Tobi on 09/02/2024.
//

import Foundation
import ComposableArchitecture

@Reducer
struct HomeReducer {
    
    @ObservableState
    struct State: Equatable {
        
    }
    
    enum Action {
        case onTransferTap
        case onRequestTap
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {

            // MARK: Navigation actions
            case .onTransferTap, .onRequestTap:
                return .none
            }
        }
    }
}

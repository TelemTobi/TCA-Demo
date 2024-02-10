//
//  ContactsReducer.swift
//  TCA-Demo
//
//  Created by Telem Tobi on 06/02/2024.
//

import Foundation
import ComposableArchitecture

@Reducer
struct ContactsReducer {
    
    @ObservableState
    struct State: Equatable {
        
    }
    
    enum Action {
        case onAppear
        case didSelectContact(String)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                return .none
                
            // MARK: Navigation actions
            case .didSelectContact:
                return .none
            }
        }
    }
}

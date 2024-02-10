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
    
    @Dependency(\.someService) var someService
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                print(someService.serviceDependency ?? "nil")
                return .none
                
            // Navigation actions are handled in the parent Navigator reducer
            case .didSelectContact:
                return .none
            }
        }
    }
}

//
//  RequestNavigator.swift
//  TCA-Demo
//
//  Created by Telem Tobi on 08/02/2024.
//

import Foundation
import ComposableArchitecture

@Reducer
struct RequestNavigator {
    
    @ObservableState
    struct State: Equatable {
        var root = AmountReducer.State()
        var path = StackState<Path.State>()
        
        var request = Request()
        
        var subtitle: String {
            [request.amount?.description, request.contact, request.reason]
                .compactMap { $0 }
                .joined(separator: " · ")
        }
    }
    
    enum Action {
        case root(AmountReducer.Action)
        case path(StackAction<Path.State, Path.Action>)
        case didTapClose
    }
    
    @Dependency(\.dismiss) private var dismiss
    
    var body: some ReducerOf<Self> {
        Scope(state: \.root, action: \.root, child: AmountReducer.init)
        
        Reduce { state, action in
            switch action {
            case let .root(.didSelectAmount(amount)):
                state.request.amount = amount
                state.path.append(.contacts(ContactsReducer.State()))
                return .none
                
            case let .path(.element(_, action: .contacts(.didSelectContact(contact)))):
                state.request.contact = contact
                state.path.append(.reason(ReasonReducer.State()))
                return .none
                
            case let .path(.element(_, action: .reason(.didSelectReason(reason)))):
                state.request.reason = reason
                // Pass the transfer to an approval module or whatever..
                return .none
                
            case .didTapClose:
                return .run { _ in
                    await dismiss()
                }
                
            case .root, .path:
                return .none
            }
        }
        .forEach(\.path, action: \.path) {
            Path()
        }
    }
}

extension RequestNavigator {
    
    @Reducer
    struct Path {
        
        @ObservableState
        enum State: Equatable {
            case contacts(ContactsReducer.State)
            case reason(ReasonReducer.State)
        }
        
        enum Action {
            case contacts(ContactsReducer.Action)
            case reason(ReasonReducer.Action)
        }
        
        var body: some ReducerOf<Self> {
            Scope(state: \.contacts, action: \.contacts, child: ContactsReducer.init)
            Scope(state: \.reason, action: \.reason, child: ReasonReducer.init)
        }
    }
    
    struct Request: Equatable {
        var contact: String?
        var amount: Float?
        var reason: String?
    }
}

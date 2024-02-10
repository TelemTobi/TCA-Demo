//
//  TransferNavigator.swift
//  TCA-Demo
//
//  Created by Telem Tobi on 06/02/2024.
//

import SwiftUI
import ComposableArchitecture

@Reducer
struct TransferNavigator {
    
    @ObservableState
    struct State: Equatable {
        var root = ContactsReducer.State()
        var path = StackState<Path.State>()
        
        var transfer = Transfer()
        
        var subtitle: String {
            [transfer.contact, transfer.amount?.description, transfer.reason]
                .compactMap { $0 }
                .joined(separator: " · ")
        }
    }
    
    enum Action {
        case root(ContactsReducer.Action)
        case path(StackAction<Path.State, Path.Action>)
        case didTapClose
    }
    
    @Dependency(\.dismiss) private var dismiss
    
    var body: some ReducerOf<Self> {
        Scope(state: \.root, action: \.root, child: ContactsReducer.init)
        
        Reduce { state, action in
            switch action {
            case let .root(.didSelectContact(contact)):
                state.transfer.contact = contact
                state.path.append(.amount(AmountReducer.State()))
                return .none
                
            case let .path(.element(_, action: .amount(.didSelectAmount(amount)))):
                state.transfer.amount = amount
                state.path.append(.reason(ReasonReducer.State()))
                return .none
                
            case let .path(.element(_, action: .reason(.didSelectReason(reason)))):
                state.transfer.reason = reason
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

extension TransferNavigator {
    
    @Reducer
    struct Path {
        
        @ObservableState
        enum State: Equatable {
            case amount(AmountReducer.State)
            case reason(ReasonReducer.State)
        }
        
        enum Action {
            case amount(AmountReducer.Action)
            case reason(ReasonReducer.Action)
        }
        
        var body: some ReducerOf<Self> {
            Scope(state: \.amount, action: \.amount, child: AmountReducer.init)
            Scope(state: \.reason, action: \.reason, child: ReasonReducer.init)
        }
    }
    
    struct Transfer: Equatable {
        var contact: String?
        var amount: Float?
        var reason: String?
    }
}

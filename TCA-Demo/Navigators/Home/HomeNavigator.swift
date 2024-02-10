//
//  HomeNavigator.swift
//  TCA-Demo
//
//  Created by Telem Tobi on 09/02/2024.
//

import Foundation
import ComposableArchitecture

@Reducer
struct HomeNavigator {
    
    @ObservableState
    struct State: Equatable {
        var root = HomeReducer.State()
        @Presents var destination: Destination.State?
    }
    
    enum Action {
        case root(HomeReducer.Action)
        case destination(PresentationAction<Destination.Action>)
    }
    
    var body: some ReducerOf<Self> {
        Scope(state: \.root, action: \.root, child: HomeReducer.init)
        
        Reduce { state, action in
            switch action {
            case .root(.onTransferTap):
                state.destination = .transfer(TransferNavigator.State())
                return .none
                
            case .root(.onRequestTap):
                state.destination = .request(RequestNavigator.State())
                return .none
                
            case .root, .destination:
                return .none
            }
        }
        .ifLet(\.$destination, action: \.destination) {
            Destination()
        }
    }
}

extension HomeNavigator {
    
    @Reducer
    struct Destination {
        
        @ObservableState
        enum State: Equatable {
            case transfer(TransferNavigator.State)
            case request(RequestNavigator.State)
        }
        
        enum Action {
            case transfer(TransferNavigator.Action)
            case request(RequestNavigator.Action)
        }
        
        var body: some ReducerOf<Self> {
            Scope(state: \.transfer, action: \.transfer, child: TransferNavigator.init)
            Scope(state: \.request, action: \.request, child: RequestNavigator.init)
        }
    }
}

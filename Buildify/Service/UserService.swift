//
//  UserService.swift
//  Buildify
//
//  Created by Omer Rahmanovic on 9/25/21.
//

import Combine
import FirebaseAuth

protocol UserServiceProtocol {
    func currentUser() -> AnyPublisher<User?, Never>
    func signInAnnonymously() -> AnyPublisher<User, IncrementError>
    func observeAuthChanges() -> AnyPublisher<User?, Never>
}

final class UserService: UserServiceProtocol {
    func currentUser() -> AnyPublisher<User?, Never> {
        Just(Auth.auth().currentUser).eraseToAnyPublisher()
    }
    
    func signInAnnonymously() -> AnyPublisher<User, IncrementError> {
        return Future<User, IncrementError> { promise in
            Auth.auth().signInAnonymously { result, error in
                if let error = error {
                    return promise(.failure(.auth(description: error.localizedDescription)))
                } else if let user = result?.user {
                    return promise(.success(user))
                }
            }
        }.eraseToAnyPublisher()
    }
    
    func observeAuthChanges() -> AnyPublisher<User?, Never> {
        Publishers.AuthPublisher().eraseToAnyPublisher()
    }
}

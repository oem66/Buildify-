//
//  ChallengeListViewModel.swift
//  Buildify
//
//  Created by Omer Rahmanovic on 10/21/21.
//

import Foundation
import Combine

final class ChallengeListViewModel: ObservableObject {
    private let userService: UserServiceProtocol
    private let challengeService: ChallengeServiceProtocol
    
    private var cancellables: [AnyCancellable] = []
    
    init(userService: UserServiceProtocol = UserService(), challengeService: ChallengeServiceProtocol = ChallengeService()) {
        self.userService = userService
        self.challengeService = challengeService
        observeChallenges()
    }
    
    private func observeChallenges() {
        userService.currentUser()
            .compactMap { $0?.uid }
            .flatMap { userId -> AnyPublisher<[Challenge], IncrementError> in
                return self.challengeService.observeChallenges(userId: userId)
            }.sink { completion in
                switch completion {
                case let .failure(error):
                    debugPrint(error.localizedDescription)
                case .finished:
                    debugPrint("Finished")
                }
            } receiveValue: { challenges in
                debugPrint(challenges)
            }.store(in: &cancellables)

    }
}

//
//  ChallengeListViewModel.swift
//  Buildify
//
//  Created by Omer Rahmanovic on 10/21/21.
//

import Foundation

final class ChallengeListViewModel: ObservableObject {
    private let userService: UserServiceProtocol
    private let challengeService: ChallengeServiceProtocol
    
    init(userService: UserServiceProtocol = UserService(), challengeService: ChallengeServiceProtocol = ChallengeService()) {
        self.userService = userService
        self.challengeService = challengeService
    }
}

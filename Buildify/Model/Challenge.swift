//
//  Challenge.swift
//  Buildify
//
//  Created by Omer Rahmanovic on 10/1/21.
//

import Foundation

struct Challenge: Codable {
    let exercise: String
    let startAmount: Int
    let increase: Int
    let lenght: Int
    let userId: String
    let startDate: Date
}

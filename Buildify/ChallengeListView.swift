//
//  ChallengeListView.swift
//  Buildify
//
//  Created by Omer Rahmanovic on 10/21/21.
//

import SwiftUI

struct ChallengeListView: View {
    
    @StateObject private var viewModel = ChallengeListViewModel()
    
    var body: some View {
        Text("Challenge List")
    }
}

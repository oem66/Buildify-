//
//  ContentView.swift
//  Buildify
//
//  Created by Omer Rahmanovic on 8/21/21.
//

import SwiftUI

struct LandingView: View {
    @State private var isActive = false
    
    var body: some View {
        NavigationView {
            GeometryReader { proxy in
                VStack {
                    Spacer().frame(height: proxy.size.height * 0.08)
                    Text("Health & Fitness")
                        .font(.system(size: 45, weight: .medium))
                        .foregroundColor(.white)
                    Spacer()
                    NavigationLink(destination: CreateView(), isActive: $isActive) {
                        Button(action: {
                            isActive = true
                        }) {
                            HStack(spacing: 15) {
                                Spacer()
                                Image(systemName: "plus.circle")
                                    .font(.system(size: 24, weight: .semibold))
                                    .foregroundColor(.white)
                                Text("Create a challenge")
                                    .font(.system(size: 24, weight: .semibold))
                                    .foregroundColor(.white)
                                Spacer()
                            }
                        }
                        .padding(20)
                        .buttonStyle(PrimaryButtonStyle())
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Image("landing_photo")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .overlay(Color.black.opacity(0.2))
                                .frame(width: proxy.size.width)
                                .edgesIgnoringSafeArea(.all)
                )
            }
        }
        .accentColor(.primary)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView().previewDevice("iPhone 12 Pro")
    }
}

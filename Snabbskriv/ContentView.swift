//
//  ContentView.swift
//  Snabbskriv
//
//  Created by Jesper Sand on 2024-06-19.
//

import SwiftUI

struct StartView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("SnabbSkriv")
                    .font(.largeTitle)
                
                NavigationLink(destination: ContentView()) {
                    Text("Börja Skriva")
                        .font(.title)
                        .foregroundColor(Color.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(15.0)
                }
            }
            .padding()
        }
    }
}

struct ContentView: View {
    // List of words
    let words = ["Kent", "Terra", "The Music", "IDLES", "Kasabian", "The Gardeners", "The Covasettes", "Inhaler"]
    
    // State variables
    @State private var randomWord: String
    @State private var userInput: String = ""
    @State private var correctCount: Int = 0
    
    init() {
        // Initialize the randomWord with a random word from the list
        _randomWord = State(initialValue: words.randomElement() ?? "")
    }
    
    var body: some View {
        VStack {
            Text(randomWord) // Display the random word
                .font(.largeTitle)
                .padding()
            
            TextField("Skriv ordet här", text: $userInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: {
                if userInput.lowercased() == randomWord.lowercased() {
                    // If input matches, increment the counter and get a new word
                    correctCount += 1
                    randomWord = words.randomElement() ?? ""
                    userInput = ""
                } else {
                    // If input does not match, reset input
                    userInput = ""
                }
            }) {
                Text("Nästa")
                    .font(.title)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            Text("Antal rätt: \(correctCount)")
                .font(.title2)
                .padding()
        }
        .padding()
    }
}

#Preview {
    StartView()
}

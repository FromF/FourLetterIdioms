//
//  ContentView.swift
//  FourLetterIdioms
//
//  Created by 藤治仁 on 2024/04/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("４文字熟語")
                    .font(.system(size: 40))
                Text("クイズ")
                    .font(.system(size: 40))

                NavigationLink("スタート", destination: QuizView())
                    .font(.system(size: 40))
                    .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}

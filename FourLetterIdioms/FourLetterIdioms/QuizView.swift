//
//  QuizView.swift
//  FourLetterIdioms
//
//  Created by 藤治仁 on 2024/04/25.
//

import SwiftUI

struct QuizView: View {
    @State private var question = "一心不乱に物事に取り組む様子。"
    @State private var answers: [String] = Array(repeating: "", count: 4)
    @State private var selects: [String] = ["一","意","専","心","竹","馬","不","乱","舟","義"]
    @State private var result = "一意専心"
    @State private var corrent = false
    @State private var incorrect = false
    
    var body: some View {
        ZStack {
            VStack {
                Text("4文字熟語クイズ")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .background(Color.green)
                    .padding()
                
                Text(question)
                    .font(.system(size: 30))
                    .frame(maxWidth: .infinity)
                    .frame(height: 120, alignment: .center)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.purple, lineWidth: 2)
                    )
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                    .padding()
                
                HStack {
                    Text(answers[0])
                        .font(.system(size: 30))
                        .frame(width: 50, height: 50, alignment: .center)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.red, lineWidth: 2)
                        )
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                    
                    Text(answers[1])
                        .font(.system(size: 30))
                        .frame(width: 50, height: 50, alignment: .center)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.red, lineWidth: 2)
                        )
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                    Text(answers[2])
                        .font(.system(size: 30))
                        .frame(width: 50, height: 50, alignment: .center)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.red, lineWidth: 2)
                        )
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                    Text(answers[3])
                        .font(.system(size: 30))
                        .frame(width: 50, height: 50, alignment: .center)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.red, lineWidth: 2)
                        )
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                }
                .padding()
                
                // 答えるボタン
                HStack {
                    Button {
                        setAnswer(selects[0])
                    } label: {
                        Text(selects[0])
                            .font(.system(size: 30))
                            .frame(width: 50, height: 50, alignment: .center)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.green))
                    }
                    Button {
                        setAnswer(selects[1])
                    } label: {
                        Text(selects[1])
                            .font(.system(size: 30))
                            .frame(width: 50, height: 50, alignment: .center)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.green))
                    }
                    Button {
                        setAnswer(selects[2])
                    } label: {
                        Text(selects[2])
                            .font(.system(size: 30))
                            .frame(width: 50, height: 50, alignment: .center)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.green))
                    }
                    Button {
                        setAnswer(selects[3])
                    } label: {
                        Text(selects[3])
                            .font(.system(size: 30))
                            .frame(width: 50, height: 50, alignment: .center)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.green))
                    }
                }
                HStack {
                    Button {
                        setAnswer(selects[4])
                    } label: {
                        Text(selects[4])
                            .font(.system(size: 30))
                            .frame(width: 50, height: 50, alignment: .center)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.green))
                    }
                    Button {
                        setAnswer(selects[5])
                    } label: {
                        Text(selects[5])
                            .font(.system(size: 30))
                            .frame(width: 50, height: 50, alignment: .center)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.green))
                    }
                    Button {
                        setAnswer(selects[6])
                    } label: {
                        Text(selects[6])
                            .font(.system(size: 30))
                            .frame(width: 50, height: 50, alignment: .center)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.green))
                    }
                    Button {
                        setAnswer(selects[7])
                    } label: {
                        Text(selects[7])
                            .font(.system(size: 30))
                            .frame(width: 50, height: 50, alignment: .center)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.green))
                    }
                }
            } // VStack
            
            if corrent {
                VStack {
                    Circle()
                        .stroke(.red, lineWidth: 10)
                        .frame(width:200, height: 200)
                    
                    Button {
                        showQuiz()
                    } label: {
                        Text("次の問題へ")
                    }
                    .padding()
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.8)))
            }
            if incorrect {
                VStack {
                    Image(systemName: "xmark")
                        .font(.system(size: 200))
                        .foregroundColor(.red)
                    Text("答え \(result)")
                        .font(.system(size: 30))
                    
                    Button {
                        showQuiz()
                    } label: {
                        Text("次の問題へ")
                    }
                    .padding()
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.8)))
            }
            
        } // ZStack
        .navigationBarBackButtonHidden(true)
        .onAppear {
            showQuiz()
        }
    }
    
    private func showQuiz() {
        guard let quiz = loadCsvFile().randomElement() else {
            return
        }
        if quiz.count < 10 {
            showQuiz()
            return
        }
        question = quiz[0]
        result = quiz[1]
        selects[0] = quiz[2]
        selects[1] = quiz[3]
        selects[2] = quiz[4]
        selects[3] = quiz[5]
        selects[4] = quiz[6]
        selects[5] = quiz[7]
        selects[6] = quiz[8]
        selects[7] = quiz[9]
        answers[0] = ""
        answers[1] = ""
        answers[2] = ""
        answers[3] = ""
        corrent = false
        incorrect = false
    }
    
    private func setAnswer(_ answer: String) {
        if answers[0].isEmpty {
            answers[0] = answer
        } else if answers[1].isEmpty {
            answers[1] = answer
        } else if answers[2].isEmpty {
            answers[2] = answer
        } else if answers[3].isEmpty {
            answers[3] = answer
            checkAnswer()
        }
    }
    
    private func checkAnswer() {
        let answer = answers[0] + answers[1] + answers[2] + answers[3]
        if result == answer {
            corrent = true
        } else {
            incorrect = true
        }
    }
    
    private func loadCsvFile() -> [[String]] {
        var csvLines: [String] = []
        
        // 読み込み先に、ファイルが存在してるかチェック
        guard let path = Bundle.main.path(forResource:"quiz", ofType:"csv") else {
            return [[]]
        }
        do {
            let csvString = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
            csvLines = csvString.components(separatedBy: .newlines)
        } catch {
            return [[]]
        }
        return csvLines.compactMap { csvLine in
            return csvLine.components(separatedBy: ",")
        }
    }

}

#Preview {
    QuizView()
}

//
//  ContentView.swift
//  Quiz
//
//  Created by heaven on 2019/06/17.
//  Copyright © 2019 heaven. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    var item: QuizItem
    @State var isCorrect: Bool = false
    
    var body: some View {
        VStack {
            Text(verbatim: item.question)
                .lineLimit(nil)
                .font(.title)
            Spacer()
            AnswerButton(title: "true",
                         color: .blue,
                         action: { self.isCorrect = self.correct(by: "True")} )
            AnswerButton(title: "false",
                         color: .red,
                         action: { self.isCorrect = self.correct(by: "False")} )
            }
            .padding()
            .presentation($isCorrect) {
                Alert(title: Text("Done"))
        }
    }
    
    func correct(by answer: String) -> Bool {
        return item.correctAnswer == answer
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView(item: quizData[0])
    }
}
#endif

struct AnswerButton : View {
    var title: String
    var color: Color
    
    var action: ()->Void
    
    var body: some View {
        return Button(action: action) {
            Text(verbatim: title)
                .foregroundColor(color)
            }
            .padding()
            .border(color, width: 1, cornerRadius: 4)
    }
}

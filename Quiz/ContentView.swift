import SwiftUI

struct ContentView : View {
    var item: QuizItem
    @State var isCorrect: Bool = false
    @State var isShowAlert: Bool = false
    
    var body: some View {
        VStack {
            Text(verbatim: item.question)
                .font(.title)
                .lineLimit(nil)
            Spacer()
            AnswerButton(title: "true",
                         color: .blue,
                         action: {
                            self.isCorrect = self.correct(by: "True")
                            self.isShowAlert = true
            })
            AnswerButton(title: "false",
                         color: .red,
                         action: {
                            self.isCorrect = self.correct(by: "False")
                            self.isShowAlert = true
            })
            }
            .padding()
            .presentation($isShowAlert) {
                Alert(title: Text(alertMessage(by: isCorrect)))
        }
    }
    
    func correct(by answer: String) -> Bool {
        return item.correctAnswer == answer
    }
    
    func alertMessage(by isCorrect: Bool) -> String {
        switch isCorrect {
        case true:
            return "정답!!!!!"
        case false:
            return "오답ㅠ"
        }
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

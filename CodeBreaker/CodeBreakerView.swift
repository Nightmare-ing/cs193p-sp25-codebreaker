import SwiftUI
import Playgrounds

struct CodeBreakerView: View {
    @State var game = CodeBreaker(pegChoices: [.red, .blue, .green, .yellow, .brown])
    
    var body: some View {
        VStack {
            CodeView(code: game.masterCode)
            CodeView(code: game.guessCode) { idx in
                game.changeGuessPeg(at: idx)
            } onButtonTap: {
                withAnimation {
                    game.addAttempt()
                }
            }

            ScrollView {
                ForEach(game.attemptsCode.indices.reversed(), id: \.self) { idx in
                    CodeView(code: game.attemptsCode[idx])
                }
            }
        }.padding()
    }
}

#Preview {
    CodeBreakerView()
}

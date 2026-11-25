import SwiftUI
import Playgrounds

struct CodeBreakerView: View {
    @State var game = CodeBreaker(pegChoices: [Peg(content: "red"), Peg(content: "blue"), Peg(content: "green"), Peg(content: "yellow"), Peg(content: "brown")])
    
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
                ForEach(game.attemptCodes.indices.reversed(), id: \.self) { idx in
                    CodeView(code: game.attemptCodes[idx])
                }
            }
            Button("Restart Game") {
                game.restartGame()
            }
        }.padding()
    }
}

#Preview {
    CodeBreakerView()
}

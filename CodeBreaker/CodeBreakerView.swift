import SwiftUI

struct CodeBreakerView: View {
    private static let themes: [[String]] = [
        ["😌", "🙃", "🫪", "🤨"],
        ["🚗", "🚲", "🛩️", "⛵"],
        Array(Color.playableNames.shuffled().prefix(4)),
    ]
    @State var game = CodeBreaker(themes: themes)
    
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

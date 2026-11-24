import SwiftUI
import Playgrounds

struct CodeBreakerView: View {
    @State var game = CodeBreaker()
    
    var body: some View {
        VStack {
            CodeView(code: game.masterCode)
            ScrollView {
                CodeView(code: game.guessCode) { idx in
                    game.changeGuessPeg(at: idx)
                } onButtonTap: {
                    withAnimation {
                        game.addAttempt()
                    }
                }

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

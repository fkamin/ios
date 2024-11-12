import SwiftUI

@main
struct MemoryGameApp: App {
    var body: some Scene {
        WindowGroup {
            @StateObject var viewModel = MemoGameViewModel()
            ContentView()
        }
    }
}

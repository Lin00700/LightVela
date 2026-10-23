import SwiftUI

// 要加载的网址，需要换站点只改这里
let startURL = URL(string: "https://lightvela.ai")!

@main
struct LightVelaApp: App {
    var body: some Scene {
        WindowGroup {
            WebView(url: startURL)
                .background(Color.white.ignoresSafeArea())
        }
    }
}

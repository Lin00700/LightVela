import SwiftUI

// ====== 配置：换站点 / 换智能体只改这里 ======
enum Config {
    static let base = "https://lightvela.ai"
    static let bot = "ins-fbf42a6e8cbe4d21a9363376e786e047"
    static let accent = Color(red: 0.263, green: 0.424, blue: 0.941)

    static func page(_ path: String) -> URL {
        URL(string: "\(base)/agents/\(path)/?bot=\(bot)")!
    }
}

@main
struct LightVelaApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}

struct RootView: View {
    var body: some View {
        TabView {
            TabPage(url: Config.page("chat"))
                .tabItem { Label("对话", systemImage: "message") }
            TabPage(url: Config.page("channels"))
                .tabItem { Label("通道", systemImage: "link") }
            TabPage(url: Config.page("skills"))
                .tabItem { Label("技能", systemImage: "puzzlepiece") }
            TabPage(url: Config.page("automations"))
                .tabItem { Label("定时任务", systemImage: "clock") }
        }
        .accentColor(Config.accent)
    }
}

struct TabPage: View {
    let url: URL
    @StateObject private var model = WebModel()

    var body: some View {
        ZStack(alignment: .top) {
            Color(UIColor.systemBackground).ignoresSafeArea()
            WebView(url: url, model: model)
            if model.loading && model.progress < 1 {
                ProgressView(value: model.progress)
                    .progressViewStyle(.linear)
                    .tint(Config.accent)
            }
        }
    }
}

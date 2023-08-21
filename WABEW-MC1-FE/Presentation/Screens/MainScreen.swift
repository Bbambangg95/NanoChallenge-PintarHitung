import SwiftUI

struct MainView: View{
    @StateObject private var productVM = ProductViewModel()
    
    var body: some View{
            TabView(){
                CalculatorScreen()
                    .environmentObject(productVM)
                    .tabItem {
                        Label("Kalkulator", systemImage: "square.grid.3x3.bottomright.filled")
                    }
                HistoryScreen()
                    .environmentObject(productVM)
                    .tabItem {
                        Label("Riwayat", systemImage: "note.text")
                    }
            }
            .tint(Color("primary90"))
        .preferredColorScheme(.light)
    }
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}


import SwiftUI

struct OnBoardingView: View {
    var body: some View {
        ZStack{
            LinearGradient(colors: [Color("gradientBG0"), Color("gradientBG1")], startPoint: .top, endPoint: .bottom)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
            VStack(alignment: .leading){
                Spacer()
                    .frame(maxHeight: 50)
                Text("Welcome to")
                    .font(.system(size: 41, weight: .semibold))
                    .foregroundColor(Color("neutral40"))
                Text("Pintar Hitung")
                    .font(.system(size: 41, weight: .semibold))
                    .foregroundColor(.white)
                featureView(
                    symbolName: "chart.bar.fill",
                    featureTitle: "Hitung Balik Modal",
                    featureDetail: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
                )
                featureView(
                    symbolName: "dollarsign.arrow.circlepath",
                    featureTitle: "Hitung Keuntungan",
                    featureDetail: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
                )
                featureView(
                    symbolName: "note.text",
                    featureTitle: "Jurnal Kalkulasi",
                    featureDetail: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
                )
                Spacer()
                    .frame(maxHeight: 150)
                Button(){
                    
                }
                label:{
                    Text("Lanjutkan")
                        .font(.system(.title2, weight: .bold))
                }
                .frame(maxWidth: .infinity, maxHeight: 54)
                .background(Color("secondary40"))
                .foregroundColor(Color("neutral80"))
                .cornerRadius(12)
            }
            .padding(.horizontal, 48)
        }
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}

struct featureView: View {
    
    public var symbolName: String = ""
    public var featureTitle: String = ""
    public var featureDetail: String = ""
    
    var body: some View {
        HStack(alignment: .center){
            ZStack{
                Rectangle()
                    .fill(.white)
                    .frame(maxWidth: 72, maxHeight: 72)
                    .cornerRadius(12)
                Image(systemName: symbolName)
                    .resizable()
                    .frame(maxWidth: 53, maxHeight: 43)
                    .foregroundColor(Color("neutral80"))
            }
            .padding(.trailing, 6)
            VStack(alignment: .leading, spacing: 0){
                Text(featureTitle)
                    .font(.system(.title3, weight: .medium))
                    .foregroundColor(.white)
                Text(featureDetail)
                    .font(.system(.subheadline))
                    .foregroundColor(.white)
                    .padding(.top, 6)
            }
        }
        .padding(.top)
    }
}

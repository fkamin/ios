import SwiftUI

struct GridView: View {
    let mydata = (1...100).map{"Id \($0)"}
    let cols = [
        //GridItem(.adaptive(minimum: 60))
        GridItem(.fixed(80)),
        GridItem(.flexible())
    ]
    var body: some View {
        ScrollView{
            LazyVGrid(columns: cols, spacing: 20){
                ForEach(mydata, id:\.self){
                    item in Text(item)
                }
            }
        }
    }
}

#Preview {
    GridView()
}

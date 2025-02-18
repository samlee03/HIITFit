//
//  WelcomeView.swift
//  HIITFit
//
//  Created by Jenn Lee on 2/4/25.
//

import SwiftUI

struct WelcomeView: View {
    @State private var showHistory = false
    @Binding var selectedTab: Int
    var body: some View {
        ZStack {
            VStack {
                HeaderView(selectedTab: .constant(0), titleText: "Welcome")
                Spacer()
                Button("History") {
                    showHistory.toggle()
                }
                .sheet(isPresented: $showHistory) {
                    HistoryView(showHistory: $showHistory)
                }
                    .padding(.bottom)
            }
            VStack {
                HStack(alignment: .bottom){
                    VStack(alignment: .leading) {
                        Text("Get fit")
                            .font(.largeTitle)
                        Text("with high intensity interval training")
                            .font(.headline)
                    }
                    Image(systemName: "1.square")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 240.0, height: 240.0)
                        .clipShape(Circle())
                }
                Button(action: { selectedTab = 0 }) {
                    Text("Get Started")
                    Image(systemName: "arrow.right.circle")
                }
                    .font(.title2)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 2))
                
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView(selectedTab: .constant(9))
    }
}

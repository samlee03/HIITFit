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
    var getStartedButton: some View{
        RaisedButton(buttonText: "Get Started"){
            selectedTab = 0
        }
        .padding()
    }
    var historyButton: some View {
        Button(
            action: {
                showHistory = true
            }, label: {
                Text("History")
                    .fontWeight(.bold)
                    .padding([.leading, .trailing], 5)
            })
        .padding(.bottom, 10)
        .buttonStyle(EmbossedButtonStyle())
    }
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HeaderView(selectedTab: .constant(0), titleText: "Welcome")
                Spacer()
                ContainerView {
                    ViewThatFits {
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
                            getStartedButton
                        }
                        VStack {
                            HStack(alignment: .bottom){
                                VStack(alignment: .leading) {
                                    Text("Get fit")
                                        .font(.largeTitle)
                                    Text("with high intensity interval training")
                                        .font(.headline)
                                }
                            }
                            getStartedButton
                        }
                    }
                }
                .frame(height: geometry.size.height * 0.8)
                historyButton
                    .sheet(isPresented: $showHistory){
                        HistoryView(showHistory: $showHistory)
                    }
            }
        }
    }
}



struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView(selectedTab: .constant(9))
    }
}

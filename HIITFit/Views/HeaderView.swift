//
//  HeaderView.swift
//  HIITFit
//
//  Created by Jenn Lee on 2/4/25.
//

import SwiftUI

struct HeaderView: View {
    @Binding var selectedTab: Int // 1
    let titleText: String
    var body: some View {
        VStack {
            Text(titleText)
                .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
            HStack {
//                Image(systemName: "hand.wave")
//                Image(systemName: "1.circle")
//                Image(systemName: "2.circle")
//                Image(systemName: "3.circle")
//                Image(systemName: "4.circle")
                ForEach(Exercise.exercises.indices, id: \.self) { index in
                    let fill = index == selectedTab ? ".fill" : ""
                    Image(systemName: "\(index + 1).circle\(fill)")
                        .onTapGesture {
                            print("Tapped on image")
                            selectedTab = index
                        }
                }
            }
            .font(.title2)
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(selectedTab: .constant(0), titleText: "Squat")
            .previewLayout(.sizeThatFits)
    }
}

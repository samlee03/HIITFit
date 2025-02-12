//
//  HeaderView.swift
//  HIITFit
//
//  Created by Jenn Lee on 2/4/25.
//

import SwiftUI

struct HeaderView: View {
    let titleText: String
    var body: some View {
        VStack {
            Text(titleText)
                .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
            HStack {
                Image(systemName: "hand.wave")
                Image(systemName: "1.circle")
                Image(systemName: "2.circle")
                Image(systemName: "3.circle")
                Image(systemName: "4.circle")
            }
            .font(.title2)
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(titleText: "Squat")
            .previewLayout(.sizeThatFits)
    }
}

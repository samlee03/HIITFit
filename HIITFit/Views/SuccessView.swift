//
//  SuccessView.swift
//  HIITFit
//
//  Created by Jenn Lee on 2/13/25.
//

import SwiftUI

struct SuccessView: View {
    @Binding var selectedTab: Int
    @Environment(\.dismiss) var dismiss
    let message = """
        Good job completing all four exercises!
        Remember tomorrow's another day.
        So eat well and get some rest.
        """
    var body: some View {
        ZStack {
            VStack {
                Image(systemName: "hand.raised.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 75, height: 75)
                    .foregroundColor(.purple)
                Text("High Five!")
                    .font(.title)
                    .fontWeight(.bold)
                Text(message)
                    .foregroundColor(.gray)
            }
            VStack {
                Spacer()
                Button("Continue") {
                    selectedTab = 9
                    dismiss()
                }
            }
        }
    }
}

struct SuccessView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessView(selectedTab: .constant(3)).presentationDetents([.medium, .large])
    }
}

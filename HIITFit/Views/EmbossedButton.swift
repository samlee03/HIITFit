//
//  EmbossedButton.swift
//  HIITFit
//
//  Created by Jenn Lee on 3/11/25.
//

import SwiftUI


struct EmbossedButtonStyle: ButtonStyle {
    var buttonShape = EmbossedButtonShape.capsule
    @ViewBuilder
    func shape(size: CGSize) -> some View {
        switch buttonShape {
        case .round:
            Circle()
                .stroke(Color("background"), lineWidth: 2)
                .frame(
                    width: max(size.width, size.height),
                    height: max(size.width, size.height))
                    .offset(x: -1, y: -max(size.width,size.height) / 2 + min(size.width, size.height / 2))
        case .capsule:
            Capsule()
                .stroke(Color("background"), lineWidth: 2)
        }
    }
    func makeBody(configuration: Configuration) -> some View {
        let shadow = Color("drop-shadow")
        let highlight = Color("drop-highlight")
        return configuration.label
            .padding(10)
            .background(
                GeometryReader { geometry in
                    shape(size: geometry.size)
                        .foregroundColor(Color("background"))
                        .shadow(color: Color("drop-shadow"), radius: 4, x: 6, y: 6)
                        .shadow(color: Color("drop-highlight"), radius: 4, x: -6, y: -6)
                }
            )
    }
}
enum EmbossedButtonShape {
    case round, capsule
}
struct EmbossedButton_Previews: PreviewProvider {
    static var previews: some View {
        Button("History") {}
            .fontWeight(.bold)
            .buttonStyle(EmbossedButtonStyle(buttonShape: .round))
            .padding(40)
            .previewLayout(.sizeThatFits)
    }
}

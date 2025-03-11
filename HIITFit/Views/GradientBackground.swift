//
//  GradientBackground.swift
//  HIITFit
//
//  Created by Jenn Lee on 3/11/25.
//

import SwiftUI

struct GradientBackground: View {
    var gradient: Gradient {
        let color1 = Color("gradient-top")
        let color2 = Color("gradient-bottom")
        let background = Color("background")
        return Gradient(
            stops: [
                Gradient.Stop(color: color1, location: 0),
                Gradient.Stop(color: color2, location: 0.85),
                Gradient.Stop(color: background, location: 0.85),
                Gradient.Stop(color: background, location: 1)
            ]
        )
        Gradient(colors: [
        Color("gradient-top"),
        Color("gradient-bottom"),
        Color("background")])
    }
    var body: some View {
        LinearGradient(
            gradient: gradient,
            startPoint: .top,
            endPoint: .bottom)
        .ignoresSafeArea()
    }
}

struct GradientBackground_Previews: PreviewProvider {
    static var previews: some View {
        GradientBackground()
    }
}

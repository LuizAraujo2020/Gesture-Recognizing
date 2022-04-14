//
//  TapView.swift
//  SPM_GestureRecognizing
//
//  Created by Luiz Araujo on 14/04/22.
//

import SwiftUI

struct TapView: View {
    @State private var color: Color = Color.primary
    
    var tapGesture: some Gesture {
        TapGesture()
            .onEnded {
                withAnimation {
                    color = Color.random()
                }
            }
    }
    
    var body: some View {
        VStack {
            Spacer()
            Rectangle()
                .foregroundColor(color)
                .frame(width: 250, height: 125)
                .gesture(tapGesture)
        }
    }
}


struct TapView_Previews: PreviewProvider {
    static var previews: some View {
        TapView()
    }
}

extension Color {
    static func random() -> Color {
        return Color(red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1))
    }
}

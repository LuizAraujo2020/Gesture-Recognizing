//
//  DragView.swift
//  SPM_GestureRecognizing
//
//  Created by Luiz Araujo on 14/04/22.
//

import SwiftUI

struct DragView: View {
    @State private var offset = CGSize.zero
    
    var dragGesture: some Gesture {
        DragGesture()
            .onChanged { value in
                offset = CGSize(width: value.startLocation.x + value.translation.width - 50,
                                height: value.startLocation.y + value.translation.height - 50)
            }
    }
    
    var body: some View {
        VStack {
            Circle()
                .foregroundColor(.teal)
                .frame(width: 100, height: 100)
                .offset(offset)
                .gesture(dragGesture)
            Spacer()
        }
    }
}

struct DragView_Previews: PreviewProvider {
    static var previews: some View {
        DragView()
    }
}

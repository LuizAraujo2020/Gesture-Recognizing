//
//  LongPressView.swift
//  SPM_GestureRecognizing
//
//  Created by Luiz Araujo on 14/04/22.
//

import SwiftUI

struct LongPressView: View {
//    @GestureState var isDetectingLongPress = false
//    @State var completedLongPress = false
    
    @State private var sizeIndex = 0
    
    private var sizes: [CGSize] = [
        CGSize(width: 150, height: 80),
        CGSize(width: 200, height: 40),
        CGSize(width: 50, height: 250),
        CGSize(width: 220, height: 100),
        CGSize(width: 90, height: 90),
        CGSize(width: Int.random(in: 10...300), height: Int.random(in: 10...300))
    ]
    
//    var longPress: some Gesture {
//        LongPressGesture(minimumDuration: 3)
//            .updating($isDetectingLongPress) { currentState, gestureState,
//                transaction in
//                gestureState = currentState
//                transaction.animation = Animation.easeIn(duration: 2.0)
//            }
//            .onEnded { finished in
//                self.completedLongPress = finished
//            }
//    }
    
    var longPressGesture: some Gesture {
        LongPressGesture()
            .onEnded { value in
                withAnimation {
                    sizeIndex += 1
                    if sizeIndex == sizes.count {
                        sizeIndex = 0
                    }
                }
            }
    }
    
    var body: some View {
        VStack {
            Capsule()
                .foregroundColor(.yellow)
                .frame(width: sizes[sizeIndex].width, height: sizes[sizeIndex].height)
                .gesture(longPressGesture)
            Spacer()
        }
    }
}

struct LongPressView_Previews: PreviewProvider {
    static var previews: some View {
        LongPressView()
    }
}

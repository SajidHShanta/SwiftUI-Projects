//
//  CircleButtonAnimationView.swift
//  AgainCrypto
//
//  Created by Sajid Shanta on 23/6/25.
//

import SwiftUI

struct CircleButtonAnimationView: View {
    
    @Binding var animate: Bool
    
    var body: some View {
        Circle()
            .stroke(lineWidth: 5.0)
            .scale(animate ? 1.0 : 0)
            .opacity(animate ? 0 : 1.0)
            .animation(animate ? .easeOut(duration: 1.0) : nil, value: animate)
            .onAppear {
                animate.toggle()
            }
    }
}

#Preview {
    CircleButtonAnimationView(animate: .constant(false))
        .frame(width: 100, height: 100)
}

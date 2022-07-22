//
//  ButtonView.swift
//  ZemogaPosts
//
//  Created by José Briones Romero on 21/7/22.
//

import SwiftUI

struct ButtonView: View {
    
    let action: (() -> Void)
    let text: String

    var body: some View {
        Button(action: action) {
            Text(text)
                .foregroundColor(Color.white)
        }
        .frame(width: 200.0, height: 50.0)
            .font(.title3)
            .background(Color.red)
            .cornerRadius(16)
        }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(action: {
            print("Button")
        }, text: "Button")
    }
}

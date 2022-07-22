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
                .fontWeight(.medium)
        }
        .frame(width: 200.0, height: 40.0)
            .font(.title3)
            .background(Color.red)
            .cornerRadius(16)
            .padding(16)
        }
}

struct ButtonView_Previews: PreviewProvider {
    
    static let buttonText = "Button"
    static var previews: some View {
        ButtonView(action: {
            print("\(buttonText)")
        }, text: buttonText)
    }
}

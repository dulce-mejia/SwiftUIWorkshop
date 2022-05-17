//
//  BuyButton.swift
//  FirstUI
//
//  Created by Juan Enriquez on 11/05/22.
//

import Foundation

import SwiftUI

struct BuyButtonView: View {

    var text: String
    var buttonColor: Color

    var body: some View {
        HStack {
            Text(text)
                .fontWeight(.semibold)
        }
        .frame(width: 200)
        .padding()
        .foregroundColor(.white)
        .background(buttonColor)
        .cornerRadius(40)
    }
}

struct BuyButtonView_Previews: PreviewProvider {
    static var previews: some View {
        BuyButtonView(text: "Buy for $18.99", buttonColor: Color.black)
    }
}

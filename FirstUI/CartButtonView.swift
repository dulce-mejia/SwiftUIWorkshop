//
//  CartButtonView.swift
//  FirstUI
//
//  Created by laura anguiano on 12/05/22.
//

import SwiftUI

struct CartButtonView: View {
    var numberOfItems: String
    var body: some View {
        VStack {
            Button(numberOfItems) {}
            .background(Color.gray)
        }
    }
}

struct CartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CartButtonView(numberOfItems: "3")
    }
}

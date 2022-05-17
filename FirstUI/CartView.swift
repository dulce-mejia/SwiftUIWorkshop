//
//  CartView.swift
//  FirstUI
//
//  Created by laura anguiano on 12/05/22.
//

import SwiftUI

struct CartView: View {
    @Binding var showModal: Bool
    @State private var animate = false
    
    @State private var showingAlert = false
    @State private var jiggling = false
    @State private var jiggling_counter = 0
    @State private var rotation_angle = 0
    
    var scale_effect = 1.2
    let rotation_angle_base = 15
    
    
    init(showModal: Binding<Bool>) {
        self._showModal = showModal
        rotation_angle = -rotation_angle_base
    }
    
    var body: some View {
        VStack(spacing: 20.0) {
            Text("Your bag")
                .font(.system(size: 40))
                .fontWeight(.bold)
            Text("0 items")
                .foregroundColor(Color.gray)
            HStack(spacing: 30.0) {
                Image("freeShipping")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .background(Color.gray.opacity(0.6))
                    .cornerRadius(10.0)
                    .onAppear {
                        jiggle_shipping_icon(apply_delay: true)
                    }
                    .rotationEffect(.degrees(jiggling ? Double(rotation_angle) : 0))
                    .scaleEffect(jiggling ? scale_effect : 1)
                    .animation(.linear(duration: 0.15), value: jiggling)
                VStack(alignment: .leading) {
                    Text("Total:")
                        .foregroundColor(Color.gray)
                    Text("$0.0")
                        .font(.system(size: 40))
                        .fontWeight(.bold)
                }
            }
            Divider()
            BuyButtonView(text: "Checkout", buttonColor: Color.yellow)
                .onTapGesture {
                    self.showModal.toggle()
                    self.showingAlert = true
                }
                .rotationEffect(.degrees(jiggling ? Double(rotation_angle) : 0))
                .scaleEffect(jiggling ? scale_effect : 1)
                .animation(.linear(duration: 0.15), value: jiggling)
            
            Spacer()
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Order confirmed"),
                  message: Text("Thank you for your purchase."),
                  dismissButton: .default(Text("Done")) {
                self.showModal.toggle()
            })
        }
        .padding(.top, 30)
        
    }
    
    func jiggle_shipping_icon(apply_delay: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + (apply_delay ? 5 : 0)) {
            withAnimation() {
                jiggling.toggle()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                withAnimation() {
                    jiggling.toggle()
                }
                jiggling_counter += 1
                
                if(jiggling_counter == 4){
                    jiggling_counter = 0
                    rotation_angle = -rotation_angle_base
                    jiggle_shipping_icon(apply_delay: true)
                } else {
                    if(rotation_angle < 0){
                        rotation_angle = rotation_angle_base
                    } else {
                        rotation_angle = -rotation_angle_base
                    }
                    jiggle_shipping_icon(apply_delay: false)
                }
            }
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(showModal: .constant(true))
    }
}

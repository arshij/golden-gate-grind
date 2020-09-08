//
//  CheckoutView.swift
//  golden-gate-grind
//
//  Created by Arshi Jujara on 8/8/20.
//  Copyright © 2020 Arshi Jujara. All rights reserved.
//

import SwiftUI
import SquareReaderSDK

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    
    static let tipAmounts = [10, 15, 20, 25, 0]
    
    @State private var paymentType = 0
    @State private var addPromoCode = false
    @State private var promoCode = ""
    @State private var tipAmount = 1
    @State private var showingPaymentAlert = false
        
    var totalPrice: Double {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(Self.tipAmounts[tipAmount])
        return total + tipValue
    }
    
    var body: some View {
        Form {
            Section {
                
                Toggle(isOn: $addPromoCode.animation()) {
                    Text("Add promo code")
                }
                
                if addPromoCode {
                    TextField("Enter promo code", text: $promoCode)
                }
            }
            
            Section(header: Text("Add a tip?")) {
                Picker("Percentage:", selection: $tipAmount) {
                    ForEach(0 ..< Self.tipAmounts.count) {
                        Text("\(Self.tipAmounts[$0])%")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header:
                Text("TOTAL: $\(totalPrice, specifier: "%.2f")")
                    .font(.largeTitle)
            ) {
                NavigationLink(destination:
                CustomCheckoutView(total: totalPrice)) {
                    Button("Pay with Square") {}
                }
            }
        }
        .navigationBarTitle(Text("Payment"), displayMode: .inline)
        .alert(isPresented: $showingPaymentAlert) {
            Alert(title: Text("Order confirmed"), message: Text("Your total was $\(totalPrice, specifier: "%.2f") - thank you!"), dismissButton: .default(Text("OK")))
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static let order = Order()
    
    static var previews: some View {
        CheckoutView().environmentObject(order)
    }
}

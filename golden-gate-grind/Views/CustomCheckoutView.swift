//
//  CustomCheckoutView.swift
//  golden-gate-grind
//
//  Created by Arshi Jujara on 9/6/20.
//  Copyright © 2020 Arshi Jujara. All rights reserved.
//

import Foundation
import SwiftUI

final class CustomCheckoutView: UIViewControllerRepresentable {
    var total: Double
    
    init(total: Double) {
        self.total = total
    }
    
    typealias UIViewControllerType = CheckoutViewController;

    func makeUIViewController(context: Context) -> CheckoutViewController {
        return CheckoutViewController(total: total);
    }
    
    func updateUIViewController(_ uiViewController: CheckoutViewController, context: Context) {
        uiViewController.total = total
    }
}

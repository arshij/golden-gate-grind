//
//  Extension-CheckoutControllerDelegate.swift
//  golden-gate-grind
//
//  Created by Arshi Jujara on 9/6/20.
//  Copyright © 2020 Arshi Jujara. All rights reserved.
//

import Foundation
import SquareReaderSDK
import SwiftUI

extension CheckoutViewController: SQRDCheckoutControllerDelegate {
    
    func checkoutController(_ checkoutController: SQRDCheckoutController, didFinishCheckoutWith result: SQRDCheckoutResult) {
        guard let vc = self.presentingViewController else { return }

        while (vc.presentingViewController != nil) {
            vc.dismiss(animated: true, completion: nil)
        }
    }
    
    func checkoutController(_ checkoutController: SQRDCheckoutController, didFailWith error: Error) {
        guard let vc = self.presentingViewController else { return }

        while (vc.presentingViewController != nil) {
            vc.dismiss(animated: true, completion: nil)
        }
    }
    
    func checkoutControllerDidCancel(_ checkoutController: SQRDCheckoutController) {
        print("Checkout cancelled.")
    }
    
}

extension CheckoutViewController {
    @objc func startCheckout(money: Int) {
        // Create a money amount in the currency of the authorized Square account
        let amountMoney = SQRDMoney(amount: money)

        // Create parameters to customize the behavior of the checkout flow.
        let params = SQRDCheckoutParameters(amountMoney: amountMoney)
        params.additionalPaymentTypes = [.cash, .manualCardEntry]

        // Create a checkout controller and call present to start checkout flow.
        let checkoutController = SQRDCheckoutController(
            parameters: params,
            delegate: self
        )
        checkoutController.present(from: self)
    }
}

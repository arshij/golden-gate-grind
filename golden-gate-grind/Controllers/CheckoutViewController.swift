//
//  CheckoutViewController.swift
//  golden-gate-grind
//
//  Created by Arshi Jujara on 9/6/20.
//  Copyright © 2020 Arshi Jujara. All rights reserved.
//

import UIKit
import SwiftUI

class CheckoutViewController: UIViewController {
    var total: Double
    
    init(total: Double) {
        self.total = total
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init has not been implemented")
    }

    override func viewDidAppear(_ animated: Bool) {
        let amount : Int = Int(total * 100);
        self.startCheckout(money: amount);
    }
}

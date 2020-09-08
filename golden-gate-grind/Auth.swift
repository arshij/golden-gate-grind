//
//  Auth.swift
//  golden-gate-grind
//
//  Created by Arshi Jujara on 8/8/20.
//  Copyright © 2020 Arshi Jujara. All rights reserved.
//

import UIKit
import CoreLocation
import AVFoundation
import SquareReaderSDK

class Auth: UIViewController {
    private lazy var locationManager = CLLocationManager()

    func requestLocationPermission() {
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted, .denied: break
        case .authorizedAlways, .authorizedWhenInUse:
            print("Location services have already been authorized.")
        @unknown default: break
        }
    }
    
    func requestMicrophonePermission() {
        AVAudioSession.sharedInstance().requestRecordPermission { authorized in
            if !authorized { return }
        }
    }
    
    func retrieveAuthorizationCode() -> String {
        return "<mobile auth code>"
    }
    
    func authorizeReaderSDKIfNeeded() {
        if SQRDReaderSDK.shared.isAuthorized {
            print("Already authorized.")
        } else {
            let authCode = retrieveAuthorizationCode()
            SQRDReaderSDK.shared.authorize(withCode: authCode) { _, error in

                if let authError = error {
                    print(authError)
                }
            }
        }
    }
}

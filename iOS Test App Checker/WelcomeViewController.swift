//
//  WelcomeViewController.swift
//  iOS Test App Checker
//
//  Created by Robin Caroff on 16/02/2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    private let session: Session = SessionWithUser()
    // Switch between the two Session object to test your logic
    //private let session: Session = SessionWithoutUser()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


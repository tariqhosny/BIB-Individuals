//
//  ResetPasswordVC.swift
//  BIB Individuals
//
//  Created by Tariq on 14/09/2021.
//

import UIKit

class ResetPasswordVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.topItem?.title = "Reset Password"
    }

}
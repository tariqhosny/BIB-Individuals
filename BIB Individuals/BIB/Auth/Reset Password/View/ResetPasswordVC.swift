//
//  ResetPasswordVC.swift
//  BIB Individuals
//
//  Created by Tariq on 14/09/2021.
//

import UIKit

class ResetPasswordVC: UIViewController {

    @IBOutlet weak var emailTf: UITextField!
    @IBOutlet weak var emailSeparatedView: UIView!
    
    var isEmailValid = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        emailTf.delegate = self
        emailTf.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.topItem?.title = "Reset Password"
    }

    @IBAction func resetPasswordTapped(_ sender: UIButton) {
        guard isEmailValid else {
            Helper.showAlert(title: "Email Validation", message: "Please enter a valid email!", self)
            return
        }
        Helper.showAlert(title: "Reset Password", message: "Please check your email to reset your password!", self)
        emailTf.text = ""
    }
}

extension ResetPasswordVC: UITextFieldDelegate{
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        emailSeparatedView.backgroundColor = .systemBlue
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        emailSeparatedView.backgroundColor = .lightGray
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        guard let email = textField.text, !email.isEmpty,
              Helper.validateEmail(email: email)
        else{
            isEmailValid = false
            return
        }
        isEmailValid = true
    }
}

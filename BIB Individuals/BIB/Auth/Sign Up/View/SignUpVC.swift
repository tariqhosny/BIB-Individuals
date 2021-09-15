//
//  SignUpVC.swift
//  BIB Individuals
//
//  Created by Tariq on 14/09/2021.
//

import UIKit

class SignUpVC: UIViewController {

    @IBOutlet weak var firstNameTf: UITextField!
    @IBOutlet weak var secondNameTf: UITextField!
    @IBOutlet weak var phoneTf: UITextField!
    @IBOutlet weak var emailTf: UITextField!
    @IBOutlet weak var passwordTf: UITextField!
    
    var isEmailValid = false
    var isPasswordValid = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        hideKeyboardWhenTappedAround()
        setupTextFields()
    }

    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.topItem?.title = "Create Account"
    }
    
    func setupTextFields(){
        emailTf.delegate = self
        passwordTf.delegate = self
        emailTf.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        passwordTf.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @IBAction func passwordToggle(_ sender: UIButton) {
        passwordTf.isSecureTextEntry.toggle()
    }
    
    @IBAction func signUpTapped(_ sender: UIButton) {
        guard let firstName = firstNameTf.text, !firstName.isEmpty else {
            showAlert(title: "Sign Up", message: "Please enter the first name!", self)
            return
        }
        
        guard let secondName = secondNameTf.text, !secondName.isEmpty else {
            showAlert(title: "Sign Up", message: "Please enter the second name!", self)
            return
        }
        
        guard let phone = phoneTf.text, !phone.isEmpty else {
            showAlert(title: "Sign Up", message: "Please enter the mobile number!", self)
            return
        }
        
        guard let email = emailTf.text, !email.isEmpty else {
            showAlert(title: "Sign Up", message: "Please enter the email!", self)
            return
        }
        
        guard isEmailValid else {
            showAlert(title: "Email Validation", message: "Please enter a valid email!", self)
            return
        }
        
        guard let password = passwordTf.text, !password.isEmpty else {
            showAlert(title: "Sign Up", message: "Please enter the password!", self)
            return
        }
        
        guard isPasswordValid else {
            showAlert(title: "Password Validation", message: "Password must contain minimum 8 characters at least 1 alphabet and 1 number!", self)
            return
        }
        
        let vc = HomeVC(nibName: "HomeVC", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension SignUpVC: UITextFieldDelegate{
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if textField == emailTf{
            guard let email = textField.text,
                  !email.isEmpty,
                  validateEmail(email: email)
            else {
                isEmailValid = false
                return
            }
            isEmailValid = true
        }
        else{
            guard let password = textField.text,
                  !password.isEmpty,
                  validatePassword(password: password)
            else {
                isPasswordValid = false
                return
            }
            isPasswordValid = true
        }
    }
}

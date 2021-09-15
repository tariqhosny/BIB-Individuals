//
//  LoginVC.swift
//  BIB Individuals
//
//  Created by Tariq on 13/09/2021.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var emailTf: UITextField!
    @IBOutlet weak var emailCheckMarkIcon: UIImageView!
    @IBOutlet weak var emailSeparatedView: UIView!
    @IBOutlet weak var passwordTf: UITextField!
    @IBOutlet weak var passwordCheckMarkIcon: UIImageView!
    @IBOutlet weak var passwordSeparatedView: UIView!
    
    var isEmailValid = false
    var isPasswordValid = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        hideKeyboardWhenTappedAround()
        setupTextFields()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.topItem?.title = ""
    }
    
    func setupTextFields(){
        emailTf.delegate = self
        passwordTf.delegate = self
        emailTf.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        passwordTf.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }

    @IBAction func resetPasswordTapped(_ sender: UIButton) {
        let vc = ResetPasswordVC(nibName: "ResetPasswordVC", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func loginTapped(_ sender: UIButton) {
        guard isEmailValid else {
            showAlert(title: "Email Validation", message: "Please enter a valid email!", self)
            return
        }
        
        guard isPasswordValid else {
            showAlert(title: "Password Validation", message: "Password must contain minimum 8 characters at least 1 alphabet and 1 number!", self)
            return
        }
        
        Helper.saveUserData(username: "Tariq M. Fathy", email: emailTf.text ?? "tariq@bib.com")
        Helper.restart()
        
    }
    
    @IBAction func facebookLoginTapped(_ sender: UIButton) {
    }
    
    @IBAction func googleLoginTapped(_ sender: UIButton) {
    }
    
    @IBAction func createAccountTapped(_ sender: UIButton) {
        let vc = SignUpVC(nibName: "SignUpVC", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension LoginVC: UITextFieldDelegate{
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == emailTf{
            emailSeparatedView.backgroundColor = .systemBlue
        }else{
            passwordSeparatedView.backgroundColor = .systemBlue
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == emailTf{
            emailSeparatedView.backgroundColor = .lightGray
        }else{
            passwordSeparatedView.backgroundColor = .lightGray
        }
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if textField == emailTf{
            guard let email = textField.text,
                  !email.isEmpty,
                  validateEmail(email: email)
            else {
                emailCheckMarkIcon.tintColor = .lightGray
                isEmailValid = false
                return
            }
            emailCheckMarkIcon.tintColor = .systemBlue
            isEmailValid = true
        }
        else{
            guard let password = textField.text,
                  !password.isEmpty,
                  validatePassword(password: password)
            else {
                passwordCheckMarkIcon.tintColor = .lightGray
                isPasswordValid = false
                return
            }
            passwordCheckMarkIcon.tintColor = .systemBlue
            isPasswordValid = true
        }
    }
}

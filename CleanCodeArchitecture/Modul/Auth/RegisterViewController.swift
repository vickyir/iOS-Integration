//
//  RegisterViewController.swift
//  CleanCodeArchitecture
//
//  Created by Vicky Irwanto on 02/03/24.
//

import UIKit

class RegisterViewController: UIViewController {
    
    
    private var progressView: UIActivityIndicatorView = {
        let progress = UIActivityIndicatorView()
        progress.color = .white
        progress.backgroundColor = .black
        progress.translatesAutoresizingMaskIntoConstraints = false
        progress.hidesWhenStopped = true
        progress.layer.zPosition = 99
        return progress
    }()
    
    private var lblLogin: UILabel = {
        let label = UILabel()
        label.text = "Register Page"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private var firstNameField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "First Name"
        textfield.textColor = .black
        textfield.backgroundColor = .white
        textfield.layer.borderWidth = 1
        textfield.layer.borderColor = UIColor.gray.cgColor
        textfield.layer.cornerRadius = 12
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textfield.leftViewMode = .always
        textfield.attributedPlaceholder = NSAttributedString(
            string: "First Name",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.black]
        )
        textfield.translatesAutoresizingMaskIntoConstraints = false
        
        return textfield
    }()
    
    private var lastNameField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Last Name"
        textfield.textColor = .black
        textfield.backgroundColor = .white
        textfield.layer.borderWidth = 1
        textfield.layer.borderColor = UIColor.gray.cgColor
        textfield.layer.cornerRadius = 12
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textfield.leftViewMode = .always
        textfield.attributedPlaceholder = NSAttributedString(
            string: "Last Name",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.black]
        )
        textfield.translatesAutoresizingMaskIntoConstraints = false
        
        return textfield
    }()
    
    private var emailField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Email"
        textfield.textColor = .black
        textfield.backgroundColor = .white
        textfield.layer.borderWidth = 1
        textfield.layer.borderColor = UIColor.gray.cgColor
        textfield.layer.cornerRadius = 12
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textfield.leftViewMode = .always
        textfield.attributedPlaceholder = NSAttributedString(
            string: "Email",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.black]
        )
        textfield.translatesAutoresizingMaskIntoConstraints = false
        
        return textfield
    }()
    
    private var passwordField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Password"
        textfield.layer.cornerRadius = 12
        textfield.textColor = .black
        textfield.layer.borderWidth = 1
        textfield.layer.borderColor = UIColor.gray.cgColor
        textfield.backgroundColor = .white
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textfield.leftViewMode = .always
        textfield.isSecureTextEntry = true
        textfield.attributedPlaceholder = NSAttributedString(
            string: "Password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.black]
        )
        textfield.translatesAutoresizingMaskIntoConstraints = false
        
        return textfield
    }()
    
    private var confirmPasswordField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Confirm Password"
        textfield.layer.cornerRadius = 12
        textfield.textColor = .black
        textfield.layer.borderWidth = 1
        textfield.layer.borderColor = UIColor.gray.cgColor
        textfield.backgroundColor = .white
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textfield.leftViewMode = .always
        textfield.isSecureTextEntry = true
        textfield.attributedPlaceholder = NSAttributedString(
            string: "Confirm Password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.black]
        )
        textfield.translatesAutoresizingMaskIntoConstraints = false
        
        return textfield
    }()
    
    
    private var btnSubmit: UIButton = {
        var button = UIButton()
        button.setTitle("Register", for: .normal)
        button.backgroundColor = .link
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    
        setProtocol()
        setView()
        setAction()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setConstraints()
    }
    
    func setProtocol(){
      
    }
    
    func setView(){
        view.addSubview(progressView)
        view.addSubview(lblLogin)
        view.addSubview(firstNameField)
        view.addSubview(lastNameField)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(confirmPasswordField)
        view.addSubview(btnSubmit)
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            progressView.topAnchor.constraint(equalTo: view.topAnchor),
            progressView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            progressView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            progressView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            lblLogin.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -200),
            lblLogin.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            firstNameField.topAnchor.constraint(equalTo: lblLogin.bottomAnchor, constant: 30),
            firstNameField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstNameField.widthAnchor.constraint(equalToConstant: 300),
            firstNameField.heightAnchor.constraint(equalToConstant: 50),
            
            lastNameField.topAnchor.constraint(equalTo: firstNameField.bottomAnchor, constant: 10),
            lastNameField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lastNameField.widthAnchor.constraint(equalToConstant: 300),
            lastNameField.heightAnchor.constraint(equalToConstant: 50),
            
            emailField.topAnchor.constraint(equalTo: lastNameField.bottomAnchor, constant: 10),
            emailField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailField.widthAnchor.constraint(equalToConstant: 300),
            emailField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 10),
            passwordField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordField.widthAnchor.constraint(equalToConstant: 300),
            passwordField.heightAnchor.constraint(equalToConstant: 50),
            
            confirmPasswordField.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 10),
            confirmPasswordField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            confirmPasswordField.widthAnchor.constraint(equalToConstant: 300),
            confirmPasswordField.heightAnchor.constraint(equalToConstant: 50),
            
            btnSubmit.topAnchor.constraint(equalTo: confirmPasswordField.bottomAnchor, constant: 15),
            btnSubmit.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            btnSubmit.widthAnchor.constraint(equalToConstant: 300),
            btnSubmit.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setAction() {
        btnSubmit.addTarget(self, action: #selector(onRegister), for: .touchUpInside)
    }
    
    @objc func onRegister(){
       
        // Show the loading overlay
        LoadingOverlay.shared.showOverlay(view: self.view, loadingText: "Registering...")
        
        guard let firstName = firstNameField.text, let lastName = lastNameField.text,
              let email = emailField.text, let password = passwordField.text, let confirmPass = confirmPasswordField.text,
              !firstName.isEmpty, !lastName.isEmpty, !email.isEmpty, !password.isEmpty, !confirmPass.isEmpty, password.count >= 6, confirmPass == password else {
            self.registerAlert(with: "alert")
            LoadingOverlay.shared.hideOverlayView()
            return
        }
        
        let model = RegisterUser(username: "\(firstName) \(lastName)", email: email, password: password)
        
        AuthService.shared.registerUser(from: model) {[weak self] isRegistered, error in
            
            LoadingOverlay.shared.hideOverlayView()
            
            if let error = error {
                self?.registerAlert(with: error.localizedDescription)
                return
            }
            
            if isRegistered {
                self?.navigationController?.popViewController(animated: true)
            }else {
                self?.registerAlert(with: "Something went wrong !!")
            }
            
        }
        
    }
    
}

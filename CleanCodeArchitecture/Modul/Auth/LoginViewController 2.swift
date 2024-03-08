//
//  LoginViewController.swift
//  CleanCodeArchitecture
//
//  Created by Vicky Irwanto on 02/03/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    private var lblLogin: UILabel = {
        let label = UILabel()
        label.text = "Login Page"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private var emailField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Email"
        textfield.autocapitalizationType = .none
        textfield.returnKeyType = .continue
        textfield.autocorrectionType = .no
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
        textfield.autocapitalizationType = .none
        textfield.autocorrectionType = .no
        textfield.returnKeyType = .done
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
    
    private var btnSubmit: UIButton = {
        var button = UIButton()
        button.setTitle("Login", for: .normal)
        button.backgroundColor = .link
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private var btnGoogle: UIButton = {
        var button = UIButton()
        button.setTitle("Login With Google", for: .normal)
        button.backgroundColor = .link
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationItem.title  = "Login User"
        
        setProtocol()
        setView()
        setAction()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setConstraints()
    }
    
    func setProtocol(){
        emailField.delegate = self
        passwordField.delegate = self
    }
    
    func setView(){
        view.addSubview(lblLogin)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(btnSubmit)
        view.addSubview(btnGoogle)
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            lblLogin.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            lblLogin.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            emailField.topAnchor.constraint(equalTo: lblLogin.bottomAnchor, constant: 30),
            emailField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailField.widthAnchor.constraint(equalToConstant: 300),
            emailField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 10),
            passwordField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordField.widthAnchor.constraint(equalToConstant: 300),
            passwordField.heightAnchor.constraint(equalToConstant: 50),
            
            btnSubmit.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 15),
            btnSubmit.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            btnSubmit.widthAnchor.constraint(equalToConstant: 300),
            btnSubmit.heightAnchor.constraint(equalToConstant: 50),
            
            btnGoogle.topAnchor.constraint(equalTo: btnSubmit.bottomAnchor, constant: 15),
            btnGoogle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            btnGoogle.widthAnchor.constraint(equalToConstant: 300),
            btnGoogle.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setAction() {
        self.hideKeyboardWhenTappedAround()
        btnSubmit.addTarget(self, action: #selector(onLogin), for: .touchUpInside)
        btnGoogle.addTarget(self, action: #selector(onGoogleLogin), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Register", style: .plain, target: self, action: #selector(setToRegister))
    }
    
    @objc func setToRegister() {
        guard let nav = self.navigationController else {
            return
        }
        self.navigationController?.pushViewController(with: nav, nav: RegisterViewController())
    }
    
    @objc func onGoogleLogin(){
        LoadingOverlay.shared.showOverlay(view: self.view, loadingText: "On Loginn")
        // Login with google
        AuthService.shared.signInWithGoogle(with: self) { isLogged, error  in
            LoadingOverlay.shared.hideOverlayView()
            if let error = error {
                self.registerAlert(with: error.localizedDescription)
                return
            }
            
            if isLogged {
                if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                    let sceneDelegate = scene.delegate as? SceneDelegate
                    sceneDelegate?.checkAuthentication()
                }
            }else{
                self.registerAlert(with: "Unexpected Error!")
            }
        }
    }
    
    @objc func onLogin() {
        
        LoadingOverlay.shared.showOverlay(view: self.view, loadingText: "On Loginn")
        
        guard let email = emailField.text, let password = passwordField.text,
              !email.isEmpty, !password.isEmpty, password.count >= 6 else{
            self.baseAlert()
            LoadingOverlay.shared.hideOverlayView()
            return
        }
        
        // With firebase
        let dataLogin = UserLogin(email: email, password: password)
        
        AuthService.shared.signIn(from: dataLogin) { error in
            LoadingOverlay.shared.hideOverlayView()
            if let error = error {
                self.registerAlert(with: "\(error.localizedDescription)")
                return
            }
            
            if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                let sceneDelegate = scene.delegate as? SceneDelegate
                sceneDelegate?.checkAuthentication()
            }
        }
        
        //        let dataLogin = loginApi(user_email: email, user_password: password)
        
        //        With Concurency
        //        Task{
        //            LoadingOverlay.shared.hideOverlayView()
        //            do {
        //                let response = try await Api.shared.loginUserAsync(data: dataLogin)
        //                let defaultRouter = ModulRouter.startEntry()
        //                guard let vc = defaultRouter.entry else {
        //                    return
        //                }
        //                self.navigationController?.pushViewController(vc, animated: true)
        //            }catch{
        //                self.registerAlert(with: error.localizedDescription)
        //            }
        //        }
        
        //        Non Concurency
        //        Api.shared.loginUser(data: dataLogin) {[weak self] result in
        //
        //            DispatchQueue.main.async {
        //                LoadingOverlay.shared.hideOverlayView()
        //            }
        //
        //            switch result {
        //            case .success(let successData):
        //                DispatchQueue.main.async {
        //                    let defaultRouter = ModulRouter.startEntry()
        //                    guard let vc = defaultRouter.entry else {
        //                        return
        //                    }
        //                    self?.navigationController?.pushViewController(vc, animated: true)
        //                }
        //
        //            case .failure(let failureData):
        //                print(failureData.localizedDescription)
        //            }
        //        }
        //
    }
    
    func setAlert(){
        let alert = UIAlertController(title: "Sorry :(", message: "please check the field", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
        present(alert, animated: true)
    }
    
    
}

extension LoginViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == emailField {
            passwordField.becomeFirstResponder()
        }else if textField == passwordField {
            view.endEditing(true)
            onLogin()
        }
        
        return true
    }
}

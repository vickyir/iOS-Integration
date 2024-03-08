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
    
    private var userProfileImg: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "person.crop.circle.fill")
        image.contentMode = .scaleAspectFill
        image.tintColor = .gray
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
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
        view.addSubview(userProfileImg)
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
            
            userProfileImg.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -250),
            userProfileImg.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userProfileImg.widthAnchor.constraint(equalToConstant: 100),
            userProfileImg.heightAnchor.constraint(equalToConstant: 100),
            
            lblLogin.topAnchor.constraint(equalTo: userProfileImg.bottomAnchor, constant: 30),
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
        let gestureProfile = UITapGestureRecognizer(target: self, action: #selector(setProfilePict))
        userProfileImg.isUserInteractionEnabled = true
        userProfileImg.addGestureRecognizer(gestureProfile)
    }
    
    @objc func setProfilePict(){
        presentPhotoActionSheet()
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

extension RegisterViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func presentPhotoActionSheet(){
        let action = UIAlertController(title: "Profile Picture",
                                       message: "Please Choose Your Photo",
                                       preferredStyle: .actionSheet)
        
        action.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        action.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: {[weak self] _ in
            self?.presentCamera()
        }))
        action.addAction(UIAlertAction(title: "Choose Photos", style: .default, handler: {[weak self] _ in
            self?.presentPhotoPicker()
        }))
        
        self.present(action, animated: true)
    }
    
    func presentCamera(){
        DispatchQueue.main.async {
            LoadingOverlay.shared.showOverlay(view: self.view , loadingText: "Wait...")
        }
        
        DispatchQueue.global(qos: .userInitiated).async {
            sleep(1)
            
            DispatchQueue.main.async {
                LoadingOverlay.shared.hideOverlayView()
                
                var vc = UIImagePickerController()
                vc.delegate = self
                vc.sourceType = .camera
                vc.allowsEditing = true
                self.present(vc, animated: true)
            }
        }
        
        
    }
    
    func presentPhotoPicker(){
        // Show the loading overlay on the main thread
        DispatchQueue.main.async {
            LoadingOverlay.shared.showOverlay(view: self.view, loadingText: "Wait...")
        }
        
        // Simulate a delay to represent the time it takes to prepare the photo picker
        DispatchQueue.global(qos: .userInitiated).async {
            sleep(1) // Simulate work being done
            
            DispatchQueue.main.async {
                // Hide the loading overlay before presenting the photo picker
                LoadingOverlay.shared.hideOverlayView()
                
                var vc = UIImagePickerController()
                vc.delegate = self
                vc.sourceType = .photoLibrary
                vc.allowsEditing = true
                
                // Present the photo picker on the main thread
                self.present(vc, animated: true)
            }
        }
        
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
            return
        }
    
        self.userProfileImg.image = image.makeCircular()
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
}

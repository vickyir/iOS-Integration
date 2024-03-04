//
//  Auth.swift
//  CleanCodeArchitecture
//
//  Created by Vicky Irwanto on 01/03/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseCore
import GoogleSignIn

class AuthService {
    
    public static let shared = AuthService()
    
    public init(){}
    
    func registerUser(from user: RegisterUser, completion: @escaping(Bool, Error?)-> Void){
        
        let username = user.username
        let email = user.email
        let password = user.password
        
        Auth.auth().createUser(withEmail: email, password: password){result,error in
            
            if let error = error {
                completion(false, error)
                return
            }
            
            guard let resultUser = result?.user else {
                completion(false, error)
                return
            }
            
            let db = Firestore.firestore()
            
            db.collection("users")
                .document(resultUser.uid)
                .setData([
                    "username" : username,
                    "email": email
                ]) { error in
                    if let error = error {
                        completion(false, error)
                        return
                    }
                    
                    completion(true, nil)
                }
            
        }
        
    }
    
    func signIn(from userRequest: UserLogin, completion: @escaping(Error?)-> Void){
        Auth.auth().signIn(withEmail: userRequest.email, password: userRequest.password) { result, error in
            if let error = error {
                completion(error)
                return
            }else{
                completion(nil)
            }
        }
    }
    
    func signInWithGoogle(with ui: UIViewController, completion: @escaping(Bool,Error?)-> Void) {
        
        GIDSignIn.sharedInstance.signIn(withPresenting: ui) { auth, error in
            if let error = error{
                completion(false, error)
                return
            }
            
            guard let user = auth?.user, let idToken = user.idToken?.tokenString else {
                return
            }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: user.accessToken.tokenString)
            
            Auth.auth().signIn(with: credential){ authResult, error in
                if error != nil {
                    print(error ?? "0")
                }else{
                    completion(true, nil)
                }
            }
        }
    }
    
    func signOut(completion: @escaping (Error?)->Void){
        do{
            try Auth.auth().signOut()
            completion(nil)
        }catch{
            completion(error)
        }
    }
    
}

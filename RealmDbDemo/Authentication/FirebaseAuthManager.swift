    //
    //  FirebaseAuthManager.swift
    //  RealmDbDemo
    //
    //  Created by user on 14/11/2022.
    //

import Foundation
import FirebaseAuth

class FirebaseAuthManager{
    
        // CREATE NEW USER
    func createUser(with email: String!,
                    andPassword pwd: String!,
                    completionBlock: @escaping (_ success: Bool, _ error: Error?)-> Void){
        
        Auth.auth().createUser(withEmail: email, password: pwd){
            (authResult, error) in
            if let user = authResult?.user{
                print(user)
                completionBlock(true, nil)
            }else {
                completionBlock(false, error)
            }
        }
    }
    
        // LOG IN EXISTING USER
    func logInUser(with email: String!,
                   andPassword pwd: String!,
                   completionBlock: @escaping (_ userEmail: String?, _ error: Error?)-> Void){
        
        Auth.auth().signIn(withEmail: email, password: pwd) { user, error in
            if let error = error, user?.user.email == nil {
                completionBlock(nil, error)
            } else{
                if let email = user?.user.email {
                    completionBlock(email, nil)
                }
            }
        }
    }
}

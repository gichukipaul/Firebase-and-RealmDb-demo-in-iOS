    //
    //  ViewController.swift
    //  RealmDbDemo
    //
    //  Created by user on 12/11/2022.
    //

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
            // Do any additional setup after loading the view.
        
        // TODO: DELETE ON PRODUCTION - Delete any previous user
        deleteAllUsers()
        
            // Create users instance
        let user = Users()
        user.id = 1
        user.username = "John"
        user.password = "pwdpwd"
        
        do {
            let realm = try Realm()
            try realm.write{
                realm.add(user)
                print("Added susccessfully")
            }
        } catch  {
            print(error.localizedDescription)
        }
    }
    
    func adduser(using id: Int, with name: String!, and password: String!){
        // Create new User
        let user = Users()
        user.id         = id
        user.username  = name
        user.password  = password
        
        // Save user
        do {
            let realm = try Realm()
            try realm.write{
                realm.add(user)
                print("Added \(user.username) successfully")
            }
        }catch{
            print(error.localizedDescription)
        }
        
    }
    
    func updateUserPwd(named name:String, with password:String){
        do{
            let realm = try Realm()
            if let searchResult = realm.objects(Users.self).filter("username ==\(name)").first{
                try realm.write{
                    searchResult.password = password
                    realm.add(searchResult)
                    print("Record updates successfully")
                }
            }
            
        }catch{
            print(error.localizedDescription)
        }
    }
    
    func deleteUser(){
        do{
            let realm = try Realm()
            if let deleteItem = realm.objects(Users.self).filter("id ==1").first{
                try realm.write{
                    realm.delete(deleteItem)
                    print("Deleted successfully")
                }
            }
        }catch{
            print(error.localizedDescription)
        }
    }
    
    func deleteAllUsers(){
        do {
            let realm = try Realm()
            try realm.write{
                realm.deleteAll()
                print("Delete all successfully")
            }
        } catch  {
            print(error.localizedDescription)
        }
    }
    
}


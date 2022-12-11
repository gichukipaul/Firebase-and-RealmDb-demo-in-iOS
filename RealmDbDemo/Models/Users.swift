    //
    //  Users.swift
    //  RealmDbDemo
    //
    //  Created by user on 13/11/2022.
    //

import UIKit
import RealmSwift

class Users: Object{
    @objc var id: Int = 0
    @objc dynamic var username: String = ""
    @objc dynamic var password: String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

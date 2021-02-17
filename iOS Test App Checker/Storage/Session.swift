//
//  Session.swift
//  iOS Test App Checker
//
//  Created by Robin Caroff on 16/02/2021.
//

import Foundation

protocol Session {
    var savedUser: User? { get }
}

class SessionWithUser: Session {
    var savedUser: User? = nil
}

class SessionWithoutUser: Session {
    var savedUser: User? = User(id: 0, name: "Foo")
}

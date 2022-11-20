//
//  AccountResponse.swift
//  kr1
//
//  Created by zedsbook on 19.11.2022.
//

import Foundation

struct AccountResponse: Codable {
    let accounts: [Account]
}

struct Account: Codable {
    let user: User
    let settings: [Setting]
}

struct Setting: Codable {
    let items: [Item]
}

struct Item: Codable {
    let title: String
    let icon: String
    let value: String?
}

struct User: Codable {
    let phoneNumber: String?
    let nickname, realName: String
    let avatar: String
}




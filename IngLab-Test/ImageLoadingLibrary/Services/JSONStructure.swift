//
//  JSONStructure.swift
//  ImageLoadingLibrary
//
//  Created by Mewan Chathuranga on 13/06/2018.
//  Copyright © 2018 Mewan Chathuranga. All rights reserved.
//

import Foundation

struct documentRoot: Decodable{
    let _root:[DevData]
    init(data: Data){
        self._root = try! JSONDecoder().decode([DevData].self, from: data)
    }
}

struct DevData : Decodable {
    let phone: String
    let isActive: Bool
    let index: Int
    let balance: String
    let _id: String
    let guid: String
    let picture: String
    let age: Int
    let eyeColor: String
    let name: String
    let gender: String
    let company: String
    let email: String
    let address: String
    let registered: String
    }
    







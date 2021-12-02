//
//  Post.swift
//  testeDelegates
//
//  Created by Roberto Edgar Geiss on 15/09/21.
//

import Foundation
 
struct Post: Codable
{

    enum CodingKeys: String, CodingKey
    {
        case id
        case title
        case body
        case userIdentifier = "userId"
    }

    let id: Int
    let title: String
    let body: String
    let userIdentifier: Int
}


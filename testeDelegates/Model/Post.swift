//
//  Post.swift
//  testeDelegates
//
//  Created by Roberto Edgar Geiss on 15/09/21.
//

import Foundation

class Post: Codable
{
    let userID, id: Int
    let title, body: String

    enum CodingKeys: String, CodingKey
    {
        case userID = "userId"
        case id, title, body
    }

    init(userID: Int, id: Int, title: String, body: String)
    {
        self.userID = userID
        self.id = id
        self.title = title
        self.body = body
    }
}

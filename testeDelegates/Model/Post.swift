//
//  Post.swift
//  testeDelegates
//
//  Created by Roberto Edgar Geiss on 15/09/21.
//

import Foundation
 
struct Post: Codable, Identifiable
{
    var userId: Int
    var id: Int
    var title: String
    var body: String
}

//    enum CodingKeys: String, CodingKey
//    {
//        case userID = "userId"
//        case id, title, body
//    }
//
//    init(userID: Int, id: Int, title: String, body: String)
//    {
//        self.userID = userID
//        self.id = id
//        self.title = title
//        self.body = body
//    }
//}

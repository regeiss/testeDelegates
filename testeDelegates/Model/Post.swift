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
//import Foundation
//import PlaygroundSupport
//
//PlaygroundPage.current.needsIndefiniteExecution = true
//
//struct Post: Codable {
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case title
//        case body
//        case userIdentifier = "userId"
//    }
//
//    let id: Int
//    let title: String
//    let body: String
//    let userIdentifier: Int
//}
//
//let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
//
//URLSession.shared.dataTask(with: url) { data, response, error in
//    if let error = error {
//        print("Error: \(error.localizedDescription)")
//        PlaygroundPage.current.finishExecution()
//    }
//    guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
//        print("Error: invalid HTTP response code")
//        PlaygroundPage.current.finishExecution()
//    }
//    guard let data = data else {
//        print("Error: missing data")
//        PlaygroundPage.current.finishExecution()
//    }
//
//    // feel free to uncomment this for debugging data
//    // print(String(data: data, encoding: .utf8))
//
//    do {
//        let decoder = JSONDecoder()
//        let posts = try decoder.decode([Post].self, from: data)
//
//        print(posts.map { $0.title })
//        PlaygroundPage.current.finishExecution()
//    }
//    catch {
//        print("Error: \(error.localizedDescription)")
//        PlaygroundPage.current.finishExecution()
//    }
//}.resume()


//
//  Network.swift
//  testeDelegates
//
//  Created by Roberto Edgar Geiss on 15/09/21.
//

import Foundation

class Network
{
    var posts = [Post]()
    
    func buscaDados() -> [Post]
    {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        let task = URLSession.shared.dataTask(with: url)
        { data, response, error in
            print(response as Any)
            if let data = data
            {
                print("dados recebidos")
                print(data)
                do
                {
                    self.posts = try JSONDecoder().decode([Post].self, from: data)
                    
                        //self.posts = posts1
                        print(self.posts.count)
                    
                }
                catch let error
                {
                    print(error.localizedDescription as Any)
                }
               
            }
        }
       task.resume()

//        posts = [Post(userID: 1, id: 1, title: "Texto1", body: "Corpo1"),
//                 Post(userID: 2, id: 21, title: "Texto12", body: "Corpo41"),
//                 Post(userID: 3, id: 31, title: "Texto31", body: "Corpo51"),
//                 Post(userID: 4, id: 41, title: "Texto41", body: "Corpo61")
//                ]
        print("Executando network")
        return self.posts
    }
}

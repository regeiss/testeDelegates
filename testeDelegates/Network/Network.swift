//
//  Network.swift
//  testeDelegates
//
//  Created by Roberto Edgar Geiss on 15/09/21.
//

import Foundation

class Network
{
    func buscaDados() -> [Post]
    {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        var posts: [Post] = []
        var request = URLRequest(url: url)
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: url)
        { data, response, error in
            if let data = data
            {
                if let posts1 = try? JSONDecoder().decode([Post].self, from: data)
                {
                    print(posts1[0].userID)
                    print(posts1[0].body)
                    posts = posts1
                }
                else
                {
                    print("Invalid Response")
                }
            } else if let error = error {
                print("HTTP Request Failed \(error)")
            }
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode)
            else
            {
                print("Error with the response, unexpected status code: \(String(describing: response))")
                   return
            }
        }
        task.resume()
        
        return posts
    }
}

//
//  Network.swift
//  testeDelegates
//
//  Created by Roberto Edgar Geiss on 15/09/21.
//

import Foundation
import Combine

class Network
{
    enum HTTPError: LocalizedError
    {
        case statusCode
    }
    
    var posts = [Post]()
    let semaphore = DispatchSemaphore(value: 0)
    
    func buscaDados() -> [Post]
    {
//        let semaphore = DispatchSemaphore(value: 0)
        print("Executando network")
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        let session = URLSession.shared
        let task = session.dataTask(with: url, completionHandler:
            {data, response, error in
                if let data = data
                {
                    do
                    {
                        let res = try JSONDecoder().decode([Post].self, from: data)
                        self.posts = res
                        self.semaphore.signal()
                    }
                    catch let error
                    {
                        print(error)
                    }
                }
                                        
        })
        
        task.resume()
        
//        let semaphore = DispatchSemaphore(value: 0)
//
//
//        self.cancellable = URLSession.shared.dataTaskPublisher(for: url)
//         .receive(on: DispatchQueue.main)
//         .map { $0.data }
//         .decode(type: [Post].self, decoder: JSONDecoder())
//         .replaceError(with: [])
//         .eraseToAnyPublisher()
//         .assign(to: \.posts, on: self)
//
        semaphore.wait()
        return posts
    }
}

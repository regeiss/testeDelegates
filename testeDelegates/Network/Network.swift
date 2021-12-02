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
    private var cancellable: AnyCancellable?
    
    enum HTTPError: LocalizedError
    {
        case statusCode
    }
    
    var posts: [Post] = []
    let semaphore = DispatchSemaphore(value: 0)
    
    func buscaDados3() -> [Post]
    {
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
        
        semaphore.wait()
        return posts
    }
    
    func buscaDados2() -> [Post]
    {
        print("Executando network 2")
//        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
//        self.cancellable = URLSession
//            .shared
//            .dataTaskPublisher(for: url)
//            .tryMap() { element -> Data in
//                guard let httpResponse = element.response as? HTTPURLResponse,
//                    httpResponse.statusCode == 200
//                else
//                {
//                    throw URLError(.badServerResponse)
//                }
//                return element.data
//                }
//            .decode(type: [Post].self, decoder: JSONDecoder())
//            .sink(receiveCompletion: { print ("Received completion: \($0).") },
//                  receiveValue: (((data: posts, response: URLResponse ))))
//
//        semaphore.wait()
        return posts
    }
    
    func buscaDados() -> [Post]
    {
        print("Executando network 2")
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        let publisher = URLSession.shared.dataTaskPublisher(for: url)
        let cancellable = publisher.sink(receiveCompletion: {completion in switch completion
            {
        case .failure(let error): print(error)
        case .finished: print("sucesso")
        }
        }, receiveValue: {value in print(value)})
        
        semaphore.wait()
        return posts
    }
}



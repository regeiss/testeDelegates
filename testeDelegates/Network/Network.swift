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
    
    func buscaDados() -> [Post]
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
    
//    func buscaDados() -> [Post]
//    {
//        print("Executando network 2")
//        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
//        let publisher = URLSession.shared.dataTaskPublisher(for: url)
//        let cancellable = publisher.sink(
//            receiveCompletion: { completion in
//                switch completion {
//                case .failure(let error):
//                    print(error)
//                case .finished:
//                    print("Success")
//                }
//            },
//            receiveValue: { value in
//                let decoder = JSONDecoder()
//
//                do {
//                    // Since each value passed into our closure will be a tuple
//                    // containing the downloaded data, as well as the network
//                    // response itself, we're accessing the 'data' property here:
//                    self.posts = try decoder.decode([Post].self, from: value.data)
//                } catch {
//                    print(error)
//                }
//            }
//        )
//        //semaphore.wait()
//        return posts
//    }
}



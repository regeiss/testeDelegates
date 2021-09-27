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
    
    private var posts = [Post]()
    {
        didSet
        {
            print("didSet -> \(self.posts.count)")
        }
    }
    private var cancellable: AnyCancellable?
            
    func buscaDados() -> [Post]
    {
        print("Executando network")
        let semaphore = DispatchSemaphore(value: 0)
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!

        self.cancellable = URLSession.shared.dataTaskPublisher(for: url)
         .receive(on: DispatchQueue.main)
         .map { $0.data }
         .decode(type: [Post].self, decoder: JSONDecoder())
         .replaceError(with: [])
         .eraseToAnyPublisher()
         .assign(to: \.posts, on: self)

//        while (posts.isEmpty)
//        {
//          print("Aguardando rede")
//        }

        semaphore.wait()
        return posts
    }
}

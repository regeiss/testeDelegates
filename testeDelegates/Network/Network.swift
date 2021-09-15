//
//  Network.swift
//  testeDelegates
//
//  Created by Roberto Edgar Geiss on 15/09/21.
//

import Foundation

class Network
{
    func buscaDados()
    {
        let session = URLSession.shared
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        let task = session.dataTask(with: url, completionHandler: { data, response, error in
            // Check the response
            print(response as Any)
            
            // Check if an error occured
            if error != nil {
                // HERE you can manage the error
                print(error as Any)
                return
            }
            
            // Serialize the data into an object
            do {
                let json = try JSONDecoder().decode([Post].self, from: data! )
                //try JSONSerialization.jsonObject(with: data!, options: [])
                print(json)
            } catch {
                print("Error during JSON serialization: \(error.localizedDescription)")
            }
            
        })
        task.resume()
        
    }
}

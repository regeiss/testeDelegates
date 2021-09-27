//
//  ServerData.swift
//  testeDelegates
//
//  Created by Roberto Edgar Geiss on 11/09/21.
//

import Foundation
 
class ServerData
{
    var someData: [Post]?
    
    func buscaJSON() -> [Post]
    {
        let rede = Network()
        someData = rede.buscaDados()  
        return someData!
    }
}

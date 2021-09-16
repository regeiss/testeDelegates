//
//  ServerData.swift
//  testeDelegates
//
//  Created by Roberto Edgar Geiss on 11/09/21.
//

import Foundation
 
class ServerData
{
    func buscaJSON() -> [Post]
    {
        let rede = Network()
        let array = rede.buscaDados()
        
        return array
    }
}

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
        let array1 = rede.buscaDados()
        print(array1.count)
        return array1
    }
}

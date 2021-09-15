//
//  Interactor.swift
//  testeDelegates
//
//  Created by Roberto Edgar Geiss on 13/09/21.
//

import Foundation

//This is a interface/protocol with one required function didFinishGettingDataFromInteractor
//The presenter class will confirm this protol and implement this function to get call back
protocol InteractorProtocol
{
  func didFinishGettingDataFromInteractor(data: [Country])
}

class Interactor
{
  //we must expose a protocol reference variable which will be used for creating contract between delagate and delegator.
  var interactorProtocol: InteractorProtocol?
  
  /*
   get data from external sources
   external sources may be a
   -URLSession based networking call
   -get data from local data base
   -get data from file system
   */
  func getDataFromExternalSources()
  {
    //some code which fetches data will go here
    let serverData = ServerData().countries
    //update presenter
    interactorProtocol?.didFinishGettingDataFromInteractor(data: serverData)
  }
}

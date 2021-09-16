//
//  Presenter.swift
//  testeDelegates
//
//  Created by Roberto Edgar Geiss on 13/09/21.
//

import Foundation 
//This is a interface/protocol with one required function didFinishGettingDataFromPresenter
//The view class will confirm this protol and implement this function to get call back

protocol PresenterProtocol
{
  func didFinishGettingDataFromPresenter(data: [Post])
}

//confirm to InteractorProtocol
class Presenter : InteractorProtocol
{
  //have a reference of interactor
  var interactor : Interactor?
  
  //create protocol reference
  var presenterProtocol : PresenterProtocol?
  
  //implement required function to get callback
  func didFinishGettingDataFromInteractor(data: [Post])
  {
    //update delegates that we have received some data
    presenterProtocol?.didFinishGettingDataFromPresenter(data: data)
  }
  
  func getDataFromInteractor()
  {
    //it needs data from Interactor, because Interactor will provide data to presenter
    interactor?.getDataFromExternalSources()
  }
  
}

//
//  Router.swift
//  testeDelegates
//
//  Created by Roberto Edgar Geiss on 13/09/21.
//
 
import Foundation
import UIKit

class Router
{
  //class function so that we can call it without creating object of router class
  class func getRootScreen() -> UIViewController
  {
    print("Executando router")
    //get storyboard object
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    //get vc object from storyboard based on identifier
    let vc = storyboard.instantiateViewController(withIdentifier: "ViewController") as! CountriesTableViewController
    
    //init presenter
    let presenter = setUpPresenter(forViewController: vc)
    
    //init interactor
    setUpInteractor(forPresenter: presenter)
    
    //init view controller's presenter object
    vc.presenter = presenter

    //finally return vc
    return vc
  }
  
  private class func setUpPresenter(forViewController vc: CountriesTableViewController) -> Presenter
  {
    //init presenter
    let presenter = Presenter()
    //vc will implement presenter's protocol functions
    presenter.presenterProtocol = vc
    return presenter
  }
  
  private class func setUpInteractor(forPresenter presenter : Presenter)
  {
    //init interactor
    let interactor = Interactor()
    //presenter will implement interactor protocol functions
    interactor.interactorProtocol = presenter
    
    //presenter's interactor must be initialized
    presenter.interactor = interactor
  }
  
}

//
//  CountriesTableViewController.swift
//  testeDelegates
//
//  Created by Roberto Edgar Geiss on 09/09/21.
//

import UIKit

class CountriesTableViewController: UITableViewController, PresenterProtocol
{
    var presenter: Presenter?
    var countries: [Country]? 
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let presenter = setUpPresenter(forViewController: self)
        setUpInteractor(forPresenter: presenter)
        presenter.getDataFromInteractor()
        
        print("viewdidload")
    }
    //must implement required function which is didFinishGettingDataFromInteractor
     func didFinishGettingDataFromPresenter(data: [Country])
     {
         countries = data
     }
     
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        print(countries?.count as Any)
        return countries?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath)
        let country = countries?[indexPath.row]
        cell.textLabel?.text = country?.name
        return cell
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        return "Secao \(section)"
    }
    
    func setUpPresenter(forViewController vc: CountriesTableViewController) -> Presenter
    {
        let presenter = Presenter()
        presenter.presenterProtocol = vc
        return presenter
    }
    
    func setUpInteractor(forPresenter presenter: Presenter)
    {
        let interactor = Interactor()
        interactor.interactorProtocol = presenter
        presenter.interactor = interactor
    }
}

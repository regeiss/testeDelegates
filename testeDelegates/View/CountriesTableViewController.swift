//
//  CountriesTableViewController.swift
//  testeDelegates
//
//  Created by Roberto Edgar Geiss on 09/09/21.
//

import UIKit 
import Combine

class CountriesTableViewController: UITableViewController, PresenterProtocol
{
    var presenter: Presenter?
    var posts: [Post]?
    var storage = Set<AnyCancellable>()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        NotificationCenter.default.publisher(for: UIWindowScene.didEnterBackgroundNotification)
            .sink{_ in print("entering background")}
            .store(in: &self.storage)
        
        let presenter = setUpPresenter(forViewController: self)
        setUpInteractor(forPresenter: presenter)
        presenter.getDataFromInteractor()
        
        print("Executando view")
    }
    
 
    
    //must implement required function which is didFinishGettingDataFromInteractor
     func didFinishGettingDataFromPresenter(data: [Post])
     {
         posts = data
     }
     
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return posts?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath)
        let post = posts?[indexPath.row]
        cell.textLabel?.text = String(post!.id) + post!.title
        return cell
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        return "Seção: posts -> \(section)"
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

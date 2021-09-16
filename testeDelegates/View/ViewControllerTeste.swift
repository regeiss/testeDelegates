//
//  ViewControllerTeste.swift
//  testeDelegates
//
//  Created by Roberto Edgar Geiss on 14/09/21.
//
import Foundation
import UIKit
 
class ViewControllerTeste: UIViewController, PresenterProtocol
{
    var presenter: Presenter?
    
    @IBOutlet weak var lblTeste: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let presenter = setUpPresenter(forViewController: self)
        setUpInteractor(forPresenter: presenter)
        presenter.getDataFromInteractor()
        print("viewdidload")
        // Do any additional setup after loading the view.
    }
    
    func didFinishGettingDataFromPresenter(data: [Post])
    {
        print(data.count)
        lblTeste.text = data[1].body
    }
    
    func setUpPresenter(forViewController vc: ViewControllerTeste) -> Presenter
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

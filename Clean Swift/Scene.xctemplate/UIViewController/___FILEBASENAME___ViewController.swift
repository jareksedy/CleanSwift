//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import UIKit

protocol ___VARIABLE_sceneName___DisplayLogic: AnyObject {
    func displaySomething(viewModel: ___VARIABLE_sceneName___.Something.ViewModel)
}

class ___VARIABLE_sceneName___ViewController: UIViewController, ___VARIABLE_sceneName___DisplayLogic {
    var interactor: ___VARIABLE_sceneName___BusinessLogic?
    var router: (___VARIABLE_sceneName___RoutingLogic & NSObjectProtocol)?
    
    // MARK: - Outlets

    // MARK: - Object lifecycle

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setupScene()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupScene()
    }

    // MARK: - Setup scene

    private func setupScene() {
        let interactor = ___VARIABLE_sceneName___Interactor()
        let presenter = ___VARIABLE_sceneName___Presenter()
        let router = ___VARIABLE_sceneName___Router()
        
        self.interactor = interactor
        self.router = router
        
        interactor.presenter = presenter
        
        presenter.viewController = self
        router.viewController = self
        
        router.dataStore = interactor
    }

    // MARK: - Routing

    override func prepare(for segue: UIStoryboardSegue, sender _: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }

    // MARK: - Actions
    
    // MARK: - Selectors
    
    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        doSomething()
    }

    // MARK: - Display methods

    func displaySomething(viewModel _: ___VARIABLE_sceneName___.Something.ViewModel) {
        // nameTextField.text = viewModel.name
    }

    // MARK: - Requests

    func doSomething() {
        let request = ___VARIABLE_sceneName___.Something.Request()
        interactor?.doSomething(request: request)
    }
}

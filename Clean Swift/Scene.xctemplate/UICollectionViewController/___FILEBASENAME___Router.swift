//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import UIKit

typealias ___VARIABLE_sceneName___RoutingLogic = ___VARIABLE_sceneName___NavigationLogic & ___VARIABLE_sceneName___DataPassing

@objc protocol ___VARIABLE_sceneName___NavigationLogic {
    // func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol ___VARIABLE_sceneName___DataPassing {
    var dataStore: ___VARIABLE_sceneName___DataStore? { get }
}

class ___VARIABLE_sceneName___Router: NSObject, ___VARIABLE_sceneName___RoutingLogic {
    weak var viewController: ___VARIABLE_sceneName___ViewController?
    var dataStore: ___VARIABLE_sceneName___DataStore?

    // MARK: - Routing

    func routeToSomewhere(segue: UIStoryboardSegue?) {
        if let segue = segue {
            let destinationVC = segue.destination as! SomewhereViewController
            var destinationDS = destinationVC.router!.dataStore!
            passDataToSomewhere(source: dataStore!, destination: &destinationDS)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
            var destinationDS = destinationVC.router!.dataStore!
            passDataToSomewhere(source: dataStore!, destination: &destinationDS)
            navigateToSomewhere(source: viewController!, destination: destinationVC)
        }
    }

    // MARK: - Navigation

    func navigateToSomewhere(source: ___VARIABLE_sceneName___ViewController, destination: SomewhereViewController) {
        source.show(destination, sender: nil)
    }

    // MARK: - Passing data

    func passDataToSomewhere(source: ___VARIABLE_sceneName___DataStore, destination: inout SomewhereDataStore) {
        destination.name = source.name
    }
}

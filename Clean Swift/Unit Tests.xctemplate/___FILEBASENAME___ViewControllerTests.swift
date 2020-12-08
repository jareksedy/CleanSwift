//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

@testable import ___PROJECTNAMEASIDENTIFIER___
import XCTest

class ___VARIABLE_sceneName___ViewControllerTests: XCTestCase {
    // MARK: Subject under test

    var sut: ___VARIABLE_sceneName___ViewController!
    var window: UIWindow!

    // MARK: Test lifecycle

    override func setUp() {
        super.setUp()
        window = UIWindow()
        setup___VARIABLE_sceneName___ViewController()
    }

    override func tearDown() {
        window = nil
        super.tearDown()
    }

    // MARK: Tests

    func test_ShouldDoSomething_WhenViewIsLoaded() {
        // Given
        let interactorSpy = ___VARIABLE_sceneName___InteractorSpy()
        sut.interactor = interactorSpy

        // When
        loadView()

        // Then
        XCTAssertTrue(spy.doSomethingCalled, "viewDidLoad() should ask the interactor to do something")
    }

    func test_ShouldDisplaySomething_WhenGetSomething() {
        // Given
        let viewModel = ___VARIABLE_sceneName___.Something.ViewModel()

        // When
        loadView()
        sut.displaySomething(viewModel: viewModel)

        // Then
        // XCTAssertEqual(sut.nameTextField.text, "", "displaySomething(viewModel:) should update the name text field")
    }

    // MARK: Helpers

    func setup___VARIABLE_sceneName___ViewController() {
        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        sut = storyboard.instantiateViewController(withIdentifier: "___VARIABLE_sceneName___ViewController") as! ___VARIABLE_sceneName___ViewController
    }

    func loadView() {
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date())
    }
}

// MARK: Test doubles

class ___VARIABLE_sceneName___InteractorSpy: ___VARIABLE_sceneName___BusinessLogic {
    var doSomethingCalled = false

    func doSomething(request _: ___VARIABLE_sceneName___.Something.Request) {
        doSomethingCalled = true
    }
}

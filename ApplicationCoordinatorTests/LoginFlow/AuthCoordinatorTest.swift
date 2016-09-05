//
//  AuthCoordinatorTest.swift
//  ApplicationCoordinator
//
//  Created by Андрей on 04.09.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import XCTest
@testable import ApplicationCoordinator

class AuthCoordinatorTest: XCTestCase {
    
    private var coordinator: Coordinator!
    private var router: Router!
    private var loginOutput: LoginFlowOutput!
    private var signUpOutput: SignUpFlowOutput!
    private var signUpController: SignUpController!
    private var termsOutput: TermsOutput!

    override func setUp() {
        super.setUp()
        
        router = RouterMock(rootController: UINavigationController())
        let loginController = LoginController.controllerFromStoryboard(.Auth)
        signUpController = SignUpController.controllerFromStoryboard(.Auth)
        signUpController.view.hidden = false
        let termsController = TermsController.controllerFromStoryboard(.Auth)
        let factory = AuthControllersFactoryMock(loginController: loginController,
                                                 signUpController: signUpController,
                                                 termsController: termsController)
        coordinator = AuthCoordinator(router: router, factory: factory)
        
        loginOutput = loginController
        signUpOutput = signUpController
        termsOutput = termsController
    }
    
    override func tearDown() {
        coordinator = nil
        router = nil
        loginOutput = nil
        signUpOutput = nil
        termsOutput = nil
        super.tearDown()
    }
    
    func testStart() {
        
        coordinator.start()
        // showLogin() must call
        XCTAssertTrue(router.rootController!.viewControllers.first is LoginController)
        XCTAssertTrue(router.rootController!.viewControllers.count == 1)
    }
    
    func testShowSignUp() {
        
        coordinator.start()
        // onSignUpButtonTap event
        loginOutput.onSignUpButtonTap!()
        XCTAssertTrue(router.rootController!.viewControllers.last is SignUpController)
    }
    
    func testShowTerms() {
        
        //show login controller
        coordinator.start()
        // show signUp controller
        loginOutput.onSignUpButtonTap!()
        //show terms controller
        signUpOutput.onTermsButtonTap!()
        XCTAssertTrue(router.rootController!.viewControllers.last is TermsController)
    }
    
    func testTermsAgreementSendToSignUpControllerSuccess() {
        
        coordinator.start()
        // show signUp controller
        loginOutput.onSignUpButtonTap!()
        //show terms controller
        signUpOutput.onTermsButtonTap!()
        //terms confirmAgreement
        termsOutput.onPopController!(true)
        router.popController()
        XCTAssertTrue(signUpController.confirmed)
    }
}

final class AuthControllersFactoryMock: AuthControllersFactory {
    
    private let loginController: LoginController
    private let signUpController: SignUpController
    private let termsController: TermsController
    
    init(loginController: LoginController, signUpController: SignUpController, termsController: TermsController) {
        
        self.loginController = loginController
        self.signUpController = signUpController
        self.termsController = termsController
    }
    
    func createLoginOutput() -> LoginFlowOutput {
        return loginController
    }
    
    func createSignUpHandler() -> protocol<SignUpFlowInput, SignUpFlowOutput> {
        return signUpController
    }
    
    func createTermsOutput() -> TermsOutput {
        return termsController
    }
}

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
    
    fileprivate var coordinator: Coordinator!
    
    fileprivate var router: Router!
    fileprivate var routerNavigationStack: [UIViewController]!
    fileprivate var routerPresentedController: UIViewController?
    
    fileprivate var loginOutput: LoginFlowOutput!
    fileprivate var signUpOutput: SignUpFlowOutput!
    fileprivate var signUpController: SignUpController!
    fileprivate var termsOutput: TermsOutput!

    override func setUp() {
        super.setUp()
        
        let routerMock = RouterMock()
        router = routerMock
        routerNavigationStack = routerMock.navigationStack
        routerPresentedController = routerMock.presented
        
        let loginController = LoginController.controllerFromStoryboard(.Auth)
        signUpController = SignUpController.controllerFromStoryboard(.Auth)
        signUpController.view.isHidden = false
        let termsController = TermsController.controllerFromStoryboard(.Auth)
        let factory = AuthControllersFactoryMock(loginController: loginController,
                                                 signUpController: signUpController,
                                                 termsController: termsController)
        coordinator = AuthCoordinator(router: routerMock, factory: factory)
        
        loginOutput = loginController
        signUpOutput = signUpController
        termsOutput = termsController
    }
    
    override func tearDown() {
        coordinator = nil
        router = nil
        routerNavigationStack = nil
        routerPresentedController = nil
        loginOutput = nil
        signUpOutput = nil
        termsOutput = nil
        
        super.tearDown()
    }
    
    func testStart() {
        
        coordinator.start()
        // showLogin() must call
        XCTAssertTrue(routerNavigationStack.first is LoginController)
        XCTAssertTrue(routerNavigationStack.count == 1)
    }
    
    func testShowSignUp() {
        
        coordinator.start()
        // onSignUpButtonTap event
        loginOutput.onSignUpButtonTap!()
        XCTAssertTrue(routerNavigationStack.last is SignUpController)
    }
    
    func testShowTerms() {
        
        //show login controller
        coordinator.start()
        // show signUp controller
        loginOutput.onSignUpButtonTap!()
        //show terms controller
        signUpOutput.onTermsButtonTap!()
        XCTAssertTrue(routerNavigationStack.last is TermsController)
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
    
    fileprivate let loginController: LoginController
    fileprivate let signUpController: SignUpController
    fileprivate let termsController: TermsController
    
    init(loginController: LoginController, signUpController: SignUpController, termsController: TermsController) {
        
        self.loginController = loginController
        self.signUpController = signUpController
        self.termsController = termsController
    }
    
    func createLoginOutput() -> LoginFlowOutput {
        return loginController
    }
    
    func createSignUpHandler() -> SignUpFlowInput & SignUpFlowOutput {
        return signUpController
    }
    
    func createTermsOutput() -> TermsOutput {
        return termsController
    }
}

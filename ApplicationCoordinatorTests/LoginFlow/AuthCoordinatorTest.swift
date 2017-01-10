//
//  AuthCoordinatorTest.swift
//  ApplicationCoordinator
//
//  Created by Andrey on 04.09.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import XCTest
@testable import ApplicationCoordinator

class AuthCoordinatorTest: XCTestCase {
    
    private var coordinator: Coordinator!
    private var router: RouterMock!
    
    private var loginOutput: LoginView!
    private var signUpOutput: SignUpView!
    private var signUpController: SignUpController!
    private var termsOutput: TermsView!

    override func setUp() {
        super.setUp()
        
        router = RouterMockImp()
        let loginController = LoginController.controllerFromStoryboard(.auth)
        signUpController = SignUpController.controllerFromStoryboard(.auth)
        signUpController.view.isHidden = false
        let termsController = TermsController.controllerFromStoryboard(.auth)
        let factory = AuthModuleFactoryMock(loginController: loginController,
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
        XCTAssertTrue(router.navigationStack.first is LoginController)
        XCTAssertTrue(router.navigationStack.count == 1)
    }
    
    func testShowSignUp() {
        
        coordinator.start()
        // onSignUpButtonTap event
        loginOutput.onSignUpButtonTap!()
        XCTAssertTrue(router.navigationStack.last is SignUpController)
        XCTAssertTrue(router.navigationStack.count == 2)
    }
    
    func testShowTerms() {
        
        //show login controller
        coordinator.start()
        // show signUp controller
        loginOutput.onSignUpButtonTap!()
        //show terms controller
        signUpOutput.onTermsButtonTap!()
        XCTAssertTrue(router.navigationStack.last is TermsController)
        XCTAssertTrue(router.navigationStack.count == 3)
    }
}

final class AuthModuleFactoryMock: AuthModuleFactory {
    
    private let loginController: LoginController
    private let signUpController: SignUpController
    private let termsController: TermsController
    
    init(loginController: LoginController,
         signUpController: SignUpController,
         termsController: TermsController) {
        
        self.loginController = loginController
        self.signUpController = signUpController
        self.termsController = termsController
    }
    
    func makeLoginOutput() -> LoginView {
        return loginController
    }
    
    func makeSignUpHandler() -> SignUpView {
        return signUpController
    }
    
    func makeTermsOutput() -> TermsView {
        return termsController
    }
}

//
//  fastlaneUITests.swift
//  fastlaneUITests
//
//  Created by Fernando Ribeiro on 4/16/16.
//  Copyright © 2016 poisonlabs. All rights reserved.
//

import XCTest

class fastlaneUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false

        let app = XCUIApplication()
        setupSnapshot(app)
        app.launch()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCorrectLogin() {
        
        let app = XCUIApplication()
        snapshot("cl-screen0")
        
        let emailTextField = app.textFields["email"]
        emailTextField.doubleTap()
        emailTextField.typeText("ferbass@gmail.com")
        
        let senhaSecureTextField = app.secureTextFields["senha"]
        senhaSecureTextField.doubleTap()
        senhaSecureTextField.typeText("123mudar")

        app.buttons["Fazer login"].tap()
        
        snapshot("cl-validLogin")
        XCTAssert(app.staticTexts["Bem vindo a area logada"].exists)
        
    }
    
    func testIncorrectLogin() {
        
        let app = XCUIApplication()
        
       snapshot("il-screen0")
        
        let emailTextField = app.textFields["email"]
        emailTextField.doubleTap()
        emailTextField.typeText("ferbass@gmail.com")
        
        let senhaSecureTextField = app.secureTextFields["senha"]
        senhaSecureTextField.doubleTap()
        senhaSecureTextField.typeText("errou!")
        
        app.buttons["Fazer login"].tap()

       snapshot("il-alertInvalidLogin")
        
        XCTAssert(app.alerts.staticTexts["Usuário ou senha invalidos"].exists)
        
    }

    func testEmptyLogin() {
        
        let app = XCUIApplication()
        
        snapshot("el-screen0")
        
        let emailTextField = app.textFields["email"]
        emailTextField.doubleTap()
        
        app.buttons["Fazer login"].tap()
        
        snapshot("el-alertEmptyError")
        
        XCTAssert(app.alerts.staticTexts["Você deve preencher email e senha para efetuar o login"].exists)
        
    }
}

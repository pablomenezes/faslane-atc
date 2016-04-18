//
//  UserTests.swift
//  fastlane
//
//  Created by Fernando Ribeiro on 4/16/16.
//  Copyright © 2016 poisonlabs. All rights reserved.
//

import XCTest
@testable import fastlane

class UserTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testValidUserLogin() {
        XCTAssertTrue(User.validatesUserLogin("ferbass@gmail.com", password: "123mudar"), "Login com sucesso")
    }
    
    func testInvalidLoginWithValidEmailAndInvaidPassword() {
        XCTAssertFalse(User.validatesUserLogin("ferbass@gmail.com", password: "1223mudar"), "Login falhou")
    }
    
    func testInvalidLoginWithInvalidEmailAndValidPasswrod() {
        XCTAssertFalse(User.validatesUserLogin("jose@gmail.com", password: "123mudar"), "Login falhou")
    }
    
    func testInvalidLoginWithInvalidEmailAndInvalidPasswrod() {
        XCTAssertFalse(User.validatesUserLogin("jose@gmail.com", password: "321trocar"), "Login falhou")
    }
}

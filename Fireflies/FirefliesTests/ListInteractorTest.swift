//
//  ListInteractorTest.swift
//  FirefliesTests
//
//  Created by Chitaranjan Sahu on 03/07/20.
//  Copyright © 2020 ANC. All rights reserved.
//


import XCTest
@testable import Fireflies

class ListInteractorTest: XCTestCase {

    var lut: MockListInteractor?
    var mockOutput: MockListInteractorOutput?
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        lut = MockListInteractor()
        mockOutput = MockListInteractorOutput()
        lut?.presenter = mockOutput
        super.setUp()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        lut =  nil
        mockOutput = nil
    }

    func testSucess(){
        lut?.isSucess = true
        lut?.fetchNotice()
        XCTAssertTrue(mockOutput?.isSucess ?? false)
    }
    func testFailed() {
        lut?.isSucess = false
        lut?.fetchNotice()
        XCTAssertFalse(mockOutput?.isSucess ?? false)
    }

}


class MockListInteractorOutput: ListInteractorOutputProtocol {
    var isSucess: Bool = false
    var error: Error?
    func mediaFetchedSuccess(noticeModelArray: Array<Media>) {
        if noticeModelArray.count > 0 {
            isSucess = true
        }
    }
    
    func mediaFetchFailed() {
        isSucess = false
    }
}

class MockListInteractor: ListInteractorInputProtocol {
    var presenter: ListInteractorOutputProtocol?
    var isSucess: Bool = false
    func fetchNotice() {
        if isSucess {
            presenter?.mediaFetchedSuccess(noticeModelArray: [Media(name: "abc")])
        }else{
            presenter?.mediaFetchFailed()
        }
    }
}


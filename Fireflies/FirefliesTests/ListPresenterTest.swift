//
//  ListPresenterTest.swift
//  FirefliesTests
//
//  Created by Chitaranjan Sahu on 03/07/20.
//  Copyright © 2020 ANC. All rights reserved.
//

import XCTest
@testable import Fireflies

class ListPresenterTest: XCTestCase {

    var lut: ListPresenter?
    var mockView: MockView?
    var mockInteractor: MockListInteractor?
    var mockRouter: MockListRouter?
    
    override func setUp() {
        lut = ListPresenter()
        mockView = MockView()
        mockInteractor = MockListInteractor()
        mockRouter = MockListRouter()
        mockInteractor?.presenter = lut
        lut?.view = mockView
        lut?.interactor = mockInteractor

        lut?.router = mockRouter
        super.setUp()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        lut = nil
        mockView = nil
        mockInteractor = nil
        mockRouter = nil
    }
    
    func testViewLoading(){
        mockInteractor?.isSucess = true
        lut?.startFetchingMediaItems()
        XCTAssertTrue(mockView?.isLoaded ?? false)
    }
    
    func testViewLoadingFailed(){
        mockInteractor?.isSucess = false
        lut?.startFetchingMediaItems()
        XCTAssertFalse(mockView?.isLoaded ?? false)
    }
    
}

class MockView: ListPresenterOutputProtocol {
    var isLoaded: Bool = false
    func showItems(noticeArray: Array<Media>) {
        if noticeArray.count > 0 {
            isLoaded = true
        }
    }
    
    func showError() {
        isLoaded = false
    }
}


class MockListRouter: ListRouterProtocol {
    var isPushDetail: Bool = false
    static func createModule() -> ListViewController {
        return ListViewController()
    }
    
    func pushDetailScreen(navigationConroller: UINavigationController) {
        isPushDetail = true
    }
    
    
}

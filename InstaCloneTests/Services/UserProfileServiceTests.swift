//
//  UserProfileServiceTests.swift
//  InstaCloneTests
//
//  Created by Rafał Małczyński on 19/11/2020.
//

import XCTest
@testable import InstaClone

class UserProfileServiceTests: XCTestCase {

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let stub = DatabaseRefereceFactoryStub(
            testJSON: ["random": 123]
        )
        
        let sut = UserProfileService(factory: stub)
        
        sut.getUser(withID: "") { result in
            switch result {
            case .success:
                XCTFail("Shouldn't be success")
            case .failure(let error):
                XCTAssert(error == ServiceError.failedToFetchUserData, "Decoding failed")
            }
        }
    }
    
    func testExample2() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let stub = DatabaseRefereceFactoryStub(
            testJSON: nil
        )
        
        let sut = UserProfileService(factory: stub)
        
        sut.getUser(withID: "") { result in
            switch result {
            case .success:
                XCTFail("Shouldn't be success")
            case .failure(let error):
                XCTAssert(error == ServiceError.jsonInvalid, "Decoding failed")
            }
        }
    }

}

struct DatabaseRefereceFactoryStub: DatabaseRefereceFactoryProtocol {
    
    var testJSON: [String: Any]?
    
    func getData(forPath path: String, completion: @escaping (DataSnapshot) -> Void) {
        completion(testJSON)
    }
    
}

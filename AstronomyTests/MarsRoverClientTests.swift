//
//  MarsRoverClientTests.swift
//  AstronomyTests
//
//  Created by Lambda_School_Loaner_259 on 4/20/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import Astronomy

class MarsRoverClientTests: XCTestCase {

    /*
     
     1. Test that Mars Rover URL is created correctly - Cannot do directly
     2. Test that Mars Rover URLRequest is created correctly
     3. Test Decoding when JSON received is valid
     4. Test decoding when JSON received is invalid
     5. Test that Mars Rover data is correctly saved
     
     */
    
    func testFetchMarsRover() {
        let client = MarsRoverClient()
        let expectation = self.expectation(description: "Wait for mars rover.")
        
        client.fetchMarsRover(named: "curiosity") { (rover, error) in
            XCTAssertTrue(rover != nil)
            XCTAssert(rover != nil)
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5)
    }
    
    func testValidData() {
        let mockRoverData = MockDataLoader(data: validRoverJSON, response: nil, error: nil)
        let client = MarsRoverClient(networkLoader: mockRoverData)
        let expectation = self.expectation(description: "Wait for mars rover.")
        var marsRover: MarsRover? = nil
        
        client.fetchMarsRover(named: "curiosity") { (rover, error) in
            marsRover = rover
            
            XCTAssertEqual(marsRover?.name, "Curiosity", "Expected a rover with the name curiosity")
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5)
    }
    
    func testInvalidData() {
        let mockRoverData = MockDataLoader(data: invalidRoverJSON, response: nil, error: nil)
        let client = MarsRoverClient(networkLoader: mockRoverData)
        let expectation = self.expectation(description: "Wait for mars rover.")
        var marsRover: MarsRover? = nil
        
        client.fetchMarsRover(named: "curiosity") { (rover, error) in
            marsRover = rover
            
            XCTAssertTrue(marsRover==nil)
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5)
    }

}

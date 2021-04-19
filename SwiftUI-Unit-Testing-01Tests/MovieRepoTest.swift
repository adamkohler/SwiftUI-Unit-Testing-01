//
//  MovieRepoTest.swift
//  FilmFestTests
//
//  Created by Brian Bansenauer on 4/22/19.
//  Copyright © 2019 Author. All rights reserved.
//

import XCTest

@testable import SwiftUI_Unit_Testing_01
class MovieRepoTest: XCTestCase {
    var sut: MovieRepository!
    
    let scifiMovie = Movie(title: "Sci-Fi", shown: false)
    let arthouseMovie = Movie(title: "Arthouse Drama", shown: false)
    let actionMovie = Movie(title: "Action/Adventure", shown: false)


    override func setUp() {
        sut = MovieDataRepository()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: Initial Value Test
    /**
     * Business Rule: MovieDataRepository starts out empty
     */
    
    func testInit_RepositoryCount_IsZero(){
        XCTAssertEqual(sut.count, 0)
    }
    
    // MARK: Add and Query Values
    /**
     * Business Rule: Movies are appended to the repo in order
     *      and accessed via their index number
     */
    
    func testAdd_RepositoryCount_IsOne()
    {
        sut.add(movie: scifiMovie)
        XCTAssertEqual(sut.count, 1)
    }
    
    //TODO : Write a test for the get functionality
    //      to show it returns the expected movie
    
    func testGetCertainMovie()
    {
        sut.add(movie: scifiMovie)
        let testMovie = sut.get(identifier: 0)!
        XCTAssertEqual(testMovie.title, scifiMovie.title)
    }
    
    func testGetAllMovieCount()
    {
        sut.add(movie: scifiMovie)
        sut.add(movie: arthouseMovie)
        sut.add(movie: actionMovie)
        let testMovie = sut.getAllMovies()
        XCTAssertEqual(testMovie.count, sut.count)
    }
    
    func testGetAllMovieSecondPosition()
    {
        sut.add(movie: scifiMovie)
        sut.add(movie: arthouseMovie)
        sut.add(movie: actionMovie)
        let testMovie = sut.get(identifier: 1)!
        XCTAssertEqual(testMovie.title, arthouseMovie.title)
        //let allMovies[] = sut.getAllMovies()
        //XCTAssertEqual(<#T##expression1: Equatable##Equatable#>, <#T##expression2: Equatable##Equatable#>)
    }

}

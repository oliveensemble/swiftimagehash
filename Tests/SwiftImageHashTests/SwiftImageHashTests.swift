//
//  SwiftImageHashTests.swift
//  SwiftImageHash
//
//  Created by Elle Lewis on 11/16/25.
//

@testable import SwiftImageHash
import Testing

struct SwiftImageHashTests {
    let astronaut = loadImageFromResource(named: "astronaut")!
    let astronautM = loadImageFromResource(named: "astronaut_M")!
    let astronautL = loadImageFromResource(named: "astronaut_L")!
    let lenna = loadImageFromResource(named: "lenna")!
    let mandrill = loadImageFromResource(named: "mandrill")!
    let mandrillDuplicate = loadImageFromResource(named: "mandrill_duplicate")!
    let pepper = loadImageFromResource(named: "pepper")!

    @Test func duplicateDistance() throws {
        let mandrillHash = SwiftImageHash.phash(image: mandrill)
        try #require(mandrillHash != nil)

        let mandrillDuplicateHash = SwiftImageHash.phash(image: mandrillDuplicate)
        try #require(mandrillDuplicateHash != nil)

        let distance = SwiftImageHash.distanceBetween(mandrillHash!, mandrillDuplicateHash!)
        try #require(distance != nil)

        #expect(distance == 0)
    }

    @Test func largerFileDuplicateDistance() throws {
        let astronautHash = SwiftImageHash.phash(image: astronaut)
        try #require(astronautHash != nil)

        let astronautLHash = SwiftImageHash.phash(image: astronautL)
        try #require(astronautLHash != nil)

        print(astronautHash!)
        print(astronautLHash!)

        let distance = SwiftImageHash.distanceBetween(astronautHash!, astronautLHash!)
        try #require(distance != nil)

        #expect(distance == 12)
    }

    @Test func smallerFileDuplicateDistance() throws {
        let astronautLHash = SwiftImageHash.phash(image: astronautL)
        try #require(astronautLHash != nil)

        let astronautMHash = SwiftImageHash.phash(image: astronautM)
        try #require(astronautMHash != nil)

        print(astronautLHash!)
        print(astronautMHash!)

        let distance = SwiftImageHash.distanceBetween(astronautLHash!, astronautMHash!)
        try #require(distance != nil)

        #expect(distance == 0)
    }

    @Test func differentFileDuplicateDistance() throws {
        let lennaHash = SwiftImageHash.phash(image: lenna)
        try #require(lennaHash != nil)

        let pepperHash = SwiftImageHash.phash(image: pepper)
        try #require(pepperHash != nil)

        print(lennaHash!)
        print(pepperHash!)

        let distance = SwiftImageHash.distanceBetween(lennaHash!, pepperHash!)
        try #require(distance != nil)

        #expect(distance == 30)
    }
}

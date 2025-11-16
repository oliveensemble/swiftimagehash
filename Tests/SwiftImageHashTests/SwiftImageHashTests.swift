//
//  SwiftImageHashTests.swift
//  SwiftImageHash
//
//  Created by Elle Lewis on 11/16/25.
//

import Testing
@testable import SwiftImageHash

struct SwiftImageHashTests {
    @Test func testDistanceCalculations() {
        guard let astronautL = loadImageFromResource(named: "astronaut_L") else {
            Issue.record("Failed to load image")
            return
        }
        let astronautLHash = SwiftImageHash.phash(image: astronautL)
        print(astronautLHash!)
        
        guard let astronautM = loadImageFromResource(named: "astronaut_M") else {
            Issue.record("Failed to load image")
            return
        }
        let astronautMHash = SwiftImageHash.phash(image: astronautM)
        print(astronautMHash!)
        print(SwiftImageHash.distanceBetween(astronautLHash!, astronautMHash!)!)
        
        guard let astronaut = loadImageFromResource(named: "astronaut") else {
            Issue.record("Failed to load image")
            return
        }
        let astronautHash = SwiftImageHash.phash(image: astronaut)
        print(astronautHash!)
        print(SwiftImageHash.distanceBetween(astronautLHash!, astronautHash!)!)
        print(SwiftImageHash.distanceBetween(astronautMHash!, astronautHash!)!)
        
        guard let lenna = loadImageFromResource(named: "lenna") else {
            Issue.record("Failed to load image")
            return
        }
        let lennaHash = SwiftImageHash.phash(image: lenna)
        print(lennaHash!)
        print(SwiftImageHash.distanceBetween(astronautMHash!, lennaHash!)!)
        print(SwiftImageHash.distanceBetween(astronautHash!, lennaHash!)!)
        
        guard let mandrill = loadImageFromResource(named: "mandrill") else {
            Issue.record("Failed to load image")
            return
        }
        let mandrillHash = SwiftImageHash.phash(image: mandrill)
        print(mandrillHash!)
        print(SwiftImageHash.distanceBetween(astronautHash!, mandrillHash!)!)
        print(SwiftImageHash.distanceBetween(lennaHash!, mandrillHash!)!)
        
        guard let pepper = loadImageFromResource(named: "pepper") else {
            Issue.record("Failed to load image")
            return
        }
        let pepperHash = SwiftImageHash.phash(image: pepper)
        print(pepperHash!)
        print(SwiftImageHash.distanceBetween(lennaHash!, pepperHash!)!)
        print(SwiftImageHash.distanceBetween(mandrillHash!, pepperHash!)!)
        
        guard let mandrillDuplicate = loadImageFromResource(named: "mandrill_duplicate") else {
            Issue.record("Failed to load image")
            return
        }
        let mandrillDuplicateHash = SwiftImageHash.phash(image: mandrillDuplicate)
        print(mandrillDuplicateHash!)
        print(SwiftImageHash.distanceBetween(pepperHash!, mandrillDuplicateHash!)!)
        print(SwiftImageHash.distanceBetween(mandrillHash!, mandrillDuplicateHash!)!)
    }
}

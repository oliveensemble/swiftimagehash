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
        guard let image1 = loadImageFromResource(named: "astronaut_L") else {
            Issue.record("Failed to load image")
            return
        }
        let phash1 = SwiftImageHash.phash(image: image1)
        print(phash1!)
        
        guard let image2 = loadImageFromResource(named: "astronaut_M") else {
            Issue.record("Failed to load image")
            return
        }
        let phash2 = SwiftImageHash.phash(image: image2)
        print(phash2!)
        print(SwiftImageHash.distanceBetween(phash1!, phash2!)!)
        
        guard let image3 = loadImageFromResource(named: "astronaut") else {
            Issue.record("Failed to load image")
            return
        }
        let phash3 = SwiftImageHash.phash(image: image3)
        print(phash3!)
        print(SwiftImageHash.distanceBetween(phash1!, phash3!)!)
        print(SwiftImageHash.distanceBetween(phash2!, phash3!)!)
        
        guard let image4 = loadImageFromResource(named: "lenna") else {
            Issue.record("Failed to load image")
            return
        }
        let phash4 = SwiftImageHash.phash(image: image4)
        print(phash4!)
        print(SwiftImageHash.distanceBetween(phash2!, phash4!)!)
        print(SwiftImageHash.distanceBetween(phash3!, phash4!)!)
        
        guard let image5 = loadImageFromResource(named: "mandrill") else {
            Issue.record("Failed to load image")
            return
        }
        let phash5 = SwiftImageHash.phash(image: image5)
        print(phash5!)
        print(SwiftImageHash.distanceBetween(phash3!, phash5!)!)
        print(SwiftImageHash.distanceBetween(phash4!, phash5!)!)
        
        guard let image6 = loadImageFromResource(named: "pepper") else {
            Issue.record("Failed to load image")
            return
        }
        let phash6 = SwiftImageHash.phash(image: image6)
        print(phash6!)
        print(SwiftImageHash.distanceBetween(phash4!, phash6!)!)
        print(SwiftImageHash.distanceBetween(phash5!, phash6!)!)
        
        guard let image7 = loadImageFromResource(named: "mandrill_duplicate") else {
            Issue.record("Failed to load image")
            return
        }
        let phash7 = SwiftImageHash.phash(image: image7)
        print(phash7!)
        print(SwiftImageHash.distanceBetween(phash6!, phash7!)!)
        print(SwiftImageHash.distanceBetween(phash5!, phash7!)!)
    }
}

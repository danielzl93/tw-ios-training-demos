//
//  demo_M08Tests.swift
//  demo_M08Tests
//
//  Created by Xin Guo on 2019/11/20.
//  Copyright © 2019 personal.emagrorrim. All rights reserved.
//

import Quick
import Nimble
@testable import demo_M08

class TableOfContentsSpec: QuickSpec {
  override func spec() {
    
    describe("number to name") {
      it("should print out for 12999") {
        let expectSpell = "twelve thousand, nine hundred and ninety nine "
        expect(expectSpell).to(equal(NumberNameSpeller.numberName(of: 12999)))
      }
      
      it("should print out for 12") {
        let expectSpell = "twelve "
        expect(expectSpell).to(equal(NumberNameSpeller.numberName(of: 12)))
      }
      
      it("should print out for 1") {
        let expectSpell = "one "
        expect(expectSpell).to(equal(NumberNameSpeller.numberName(of: 1)))
      }
      
      it("should print out for -1") {
        let expectSpell = "negative Number!"
        expect(expectSpell).to(equal(NumberNameSpeller.numberName(of: -1)))
      }
    }
  }
}

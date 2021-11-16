//
//  EmojiMVVMTests.swift
//  EmojiMVVMTests
//
//  Created by Maria Eugênia P Teixeira on 08/11/21.
//

import XCTest
@testable import EmojiMVVM

class EmojiMVVMTests: XCTestCase {
    
    let sut = HomeViewModel()
    
    override func setUpWithError() throws {
        sut.emojis = [EmojiModel(emoji: "😺"), EmojiModel(emoji: "😼")]
    }

    func test_button_tapped() {
        let presenter = MockPresentable()
        sut.presenter = presenter
        sut.didTapButton()
        XCTAssertTrue(presenter.labelUpdated)
    }

}

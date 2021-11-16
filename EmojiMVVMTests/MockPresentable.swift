//
//  MockPresentable.swift
//  EmojiMVVMTests
//
//  Created by Maria Eugênia P Teixeira on 08/11/21.
//

import Foundation
@testable import EmojiMVVM

class MockPresentable: Presentable {
    var labelUpdated = false
    
    func updateLabel(with text: String) {
        labelUpdated = true
    }
}

//
//  HomeViewModel.swift
//  DevpassViewModel
//
//  Created by Maria EugΓͺnia P Teixeira on 08/11/21.
//

import Foundation

protocol Presentable {
    func updateLabel(with text: String)
    func presentNewScreen(with data: String)
}

class HomeViewModel {
    
    var emojis: [EmojiModel]
    var presenter: Presentable?
    
    init() {
        self.emojis = [
            EmojiModel(emoji: "π"),
            EmojiModel(emoji: "π"),
            EmojiModel(emoji: "π"),
            EmojiModel(emoji: "π"),
            EmojiModel(emoji: "π"),
            EmojiModel(emoji: "βοΈ"),
            EmojiModel(emoji: "π")
        ]
    }
    
    func didTapButton() {
        let index = Int.random(in: 0..<emojis.count)
        let selected = emojis[index]
        presenter?.updateLabel(with: selected.emoji)
    }
    
    func didTapNextButton() {
        presenter?.presentNewScreen(with: "π€")
    }
    
}

//
//  DetailViewModel.swift
//  EmojiMVVM
//
//  Created by Maria Eugênia P Teixeira on 09/11/21.
//

import Foundation

protocol DetailPresentable {
    func showData(_ data: String)
    func isLoading(_ isLoading: Bool)
    func showError(title: String, message: String)
}

class DetailViewModel {
    
    var presenter: DetailPresentable?
    let data: String
    
    init(data: String) {
        self.data = data
    }
    
    func loadData() {
        presenter?.isLoading(true)
        //faz chamada
        //succeso
        presenter?.showData(data)
        //erro
        presenter?.showError(title: "Ops!", message: "Deu erro")
    }
}



extension DetailViewModel {
    
    enum DefaultKey: String {
        case isFirstTimeOpen = "isFirstTimeOpen"
        case dic = "dic"
    }
    
    
    func save() {
        UserDefaults.standard.set(true, forKey: DefaultKey.isFirstTimeOpen.rawValue)
        UserDefaults.standard.set(["key":"value"], forKey: DefaultKey.dic.rawValue)
    }
    
    func get() {
        let bool = UserDefaults.standard.bool(forKey: DefaultKey.isFirstTimeOpen.rawValue)
        let dic = UserDefaults.standard.object(forKey: DefaultKey.dic.rawValue)
    }
}

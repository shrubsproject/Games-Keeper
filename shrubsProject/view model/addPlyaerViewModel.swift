//
//  addPlyaerViewModel.swift
//  shrubsProject
//
//  Created by Ilya Egorov on 02.01.2022.
//

import Foundation

protocol addPlayerViewModelCordinat {
    func dismiss()
}

class addPlayerViewModel {
    
    let coordinat: addPlayerViewModelCordinat
    var onPlayerAdd: ((String) -> Bool)?
    var onAlert: ((String) -> Void)?
    
    func plusPlayer(name: String){
        guard let onPlayerAdd = onPlayerAdd else{ return }
        
        if onPlayerAdd(name) {
            coordinat.dismiss()
        }else{
            onAlert?("the \"\(name)\"")
        }
    }
    
    func goBack(){
        coordinat.dismiss()
    }
    
    init (coordinat: addPlayerViewModelCordinat){
        self.coordinat = coordinat
    }
}

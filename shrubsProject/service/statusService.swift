//
//  statusService.swift
//  shrubsProject
//
//  Created by Ilya Egorov on 26.01.2022.
//

import Foundation

class statusServis{
    
    let key: String
    
    func loadEnt() -> Entity?{
        guard let data = UserDefaults.standard.object(forKey: key) as? Data else {return nil}
        let decoder = JSONDecoder()
        guard let loadedEnt = try? decoder.decode(Entity.self, from: data) else {return nil}
        return loadedEnt
    }
    
    func store(entity: Entity){
        let encoder = JSONEncoder()
        let data = try? encoder.encode(entity)
        guard let data = data else {return}
        UserDefaults.standard.setValue(data, forKey: key)
    }
    
    func clearEnt(){
        UserDefaults.standard.removeObject(forKey: key)
    }
    
    init(key: String){
        self.key = key
    }
}

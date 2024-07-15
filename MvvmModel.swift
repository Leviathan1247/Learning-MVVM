//
//  MvvmModel.swift
//  LearningPatternMVVM
//
//  Created by Левиафан on 2024-07-08.
//

import Foundation


enum MvvmModel {
    case initial(Model)
    case loading(Model)
    case success(Model)
    case failure(Model)
    
    
    struct Model {
        let image: String
        let isHiden: Bool
    }
}

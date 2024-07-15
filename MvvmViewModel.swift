//
//  MvvmViewModel.swift
//  LearningPatternMVVM
//
//  Created by Левиафан on 2024-07-08.
//

import Foundation

protocol MvvmViewModelProtocol: AnyObject {
    var updateView:((MvvmModel)->())? { get set }
    
    func showFirstImage()
    func showSecondImage()
    func showDefaultImage()
}

class MvvmViewModel: MvvmViewModelProtocol {
    var updateView: ((MvvmModel) -> ())?
    
    func showFirstImage() {
        updateView?(.loading(MvvmModel.Model(image: "Loading", isHiden: false)))
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.updateView?(.success(MvvmModel.Model(image: "Success", isHiden: true)))
        }
    }
    
    func showSecondImage() {
        updateView?(.loading(MvvmModel.Model(image: "Loading", isHiden: false)))
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.updateView?(.failure(MvvmModel.Model(image: "Failure", isHiden: true)))
        }
    }
    
    func showDefaultImage() {
        updateView?(.initial(MvvmModel.Model(image: "Default", isHiden: true)))
    }
}


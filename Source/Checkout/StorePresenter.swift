//
//  StorePresenter.swift
//  Checkout
//
//  Created by Calebe Emerick on 30/11/16.
//  Copyright © 2016 CalebeEmerick. All rights reserved.
//

import Foundation

struct StorePresenter {
    
    private let service = StoreService()
    private unowned var storeView: StoresView
    
    init(storeView: StoresView) {
        
        self.storeView = storeView
    }
    
    func getStores() {
        
        guard let key = LoginManager.sharedInstance.user?.customerKey else { return }

        storeView.showLoading()
        DispatchQueue.main.async {
            
            self.service.getStores(from: key) { result in
                
                switch result {
                    
                case let .success(stores):
                    self.storeView.hideLoading()
                    self.storeView.update(stores: stores)
                    self.storeView.showContainer()
                    
                case let .failure(error):
                    self.storeView.hideLoading()
                    self.storeView.showError(message: error)
                }
            }
        }
    }   
}

//
//  ViewControllerViewModel.swift
//  SampleUI_Version2
//
//  Created by Akanksha Gupta on 03/08/21.
//

import Foundation

class ProductListViewModel: NSObject {
    
    private var productListArray = [Products]()
    private var productCellViewModel = [ProductCellViewModel]()
    private var apiService = APIService()
    
    func apiCall(completion: @escaping() -> Void) {
        apiService.fetchProductDetails { result in
            self.productListArray = result?.data?.products ?? []
//            print(self.productListArray)
        }
    }
}

extension ProductListViewModel {
    
    func numberOfRowsInSection() -> Int {
        return productListArray.count
    }
    
    func getCellModel(at indexPath: IndexPath) -> ProductCellViewModel {
        return productCellViewModel[indexPath.row]
    }
    
}



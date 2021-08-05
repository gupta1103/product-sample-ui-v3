//
//  ViewControllerViewModel.swift
//  SampleUI_Version2
//
//  Created by Akanksha Gupta on 03/08/21.
//

import Foundation

class ProductListViewModel: NSObject {
    
    private var productListArray = [Products]()
//     private var productCellViewModel = [ProductCellViewModel]()
    private var apiService = APIService()
    
}

extension ProductListViewModel {
    
    func numberOfRowsInSection() -> Int {
        return productListArray.count
    }
    
    func getCellModel(indexPath: IndexPath) -> ProductCellViewModel {
        return ProductCellViewModel(with: productListArray[indexPath.row])
    }
    
    func updateProducts(with productModel: ProductModel?) {
        guard let productModel = productModel else { return }
        productListArray = productModel.data?.products ?? []
    }
    
    func apiCall(completion: @escaping() -> Void) {
        apiService.fetchProductDetails { (result) in
            self.updateProducts(with: result)
            completion()
        }
    }
    
}



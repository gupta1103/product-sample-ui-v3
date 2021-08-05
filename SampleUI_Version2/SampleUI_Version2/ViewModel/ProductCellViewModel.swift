//
//  ProductTableViewCellViewModel.swift
//  SampleUI_Version2
//
//  Created by Akanksha Gupta on 03/08/21.
//

import Foundation

class ProductCellViewModel {
    
    let productImageView: String?
    let productName: String?
    let productPrice: String?
    let productOfferPrice: String?
    let productStrikeThroughPriceDisplay: String?
    
    init(with model: Products?) {
        productImageView = model?.images? [0]
        productName = model?.name ?? ""
        productPrice = model?.price?.priceDisplay
        productOfferPrice = model?.price?.offerPriceDisplay
        productStrikeThroughPriceDisplay = model?.price?.strikeThroughPriceDisplay ?? ""
    }
    
}


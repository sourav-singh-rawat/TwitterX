//
//  TXImageView.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 25/12/22.
//

import UIKit

class TXImageView: UIImageView {
    init(
        image: UIImage?,
        width: CGFloat = 50,
        height: CGFloat = 50
    ) {
        super.init(image: image)
        
        self.image = image
        contentMode = .scaleAspectFit
        tintColor = TXTheme.shared.color.onPrimary
        
        self.height(height)
        self.width(width)
    }
    
    init(
        imageUrl: String,
        width: CGFloat = 50,
        height: CGFloat = 50
    ) {
        
        var image: UIImage?
        
        let assetRepository = TXAssetsRepository()
        
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        
        DispatchQueue.global().async {
            assetRepository.dowloadDataFromImageUrl(
                with: TXDownloadDataFromImageUrlRequest(urlString: imageUrl)
            ) {
                result in
                
                switch result {
                case .success(let response):
                    let imageData = response.imageData
                    
                    image = UIImage(data: imageData)
                case .failure(let response):
                    image = nil
                    //TODO: show toast
                    print(response.localizedDescription)
                }
                
                dispatchGroup.leave()
            }
        }
        
        dispatchGroup.wait()
        
        super.init(image: image)
        
        self.image = image
        contentMode = .scaleAspectFit
        
        self.height(height)
        self.width(width)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

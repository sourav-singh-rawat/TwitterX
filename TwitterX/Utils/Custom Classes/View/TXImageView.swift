//
//  TXImageView.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 25/12/22.
//

import UIKit

class TXImageView: UIImageView {
    private var width: CGFloat?,height: CGFloat?
    
    func setImage(image: UIImage,width: CGFloat = 50, height: CGFloat = 50) {
        self.width = width
        self.height = height
        
        self.image = image
        contentMode = .scaleAspectFit
        clipsToBounds = true
        tintColor = TXTheme.shared.color.onPrimary
        
        self.height(height)
        self.width(width)
    }
    
    func setImage(imageUrl: String,width: CGFloat = 50, height: CGFloat = 50) {
        self.width = width
        self.height = height
        
        var image: UIImage?
        
        let catchedImageData = TXMediaCatch.shared.catchedImages[imageUrl]
        
        if let catchedImageData = catchedImageData {
            image = UIImage(data: catchedImageData)
        }else {
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
                        
                        TXMediaCatch.shared.catchedImages[imageUrl] = imageData
                        
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
        }
        
        backgroundColor = TXTheme.shared.color.primary
        self.image = image
        contentMode = .scaleAspectFit
        clipsToBounds = true
        
        self.height(height)
        self.width(width)
    }
    
    func toRoundedImage() {
        if let _width = width, let _height = height, _width == _height {
            layer.cornerRadius = _width/2
            layer.masksToBounds = true
        }else {
            fatalError("Not a square image")
        }
    }
    
    func withBorder(
        borderColor color: UIColor = UIColor.white,
        borderWidth width: CGFloat = 3
    ){
        layer.borderColor = color.cgColor
        layer.borderWidth = width
    }
}

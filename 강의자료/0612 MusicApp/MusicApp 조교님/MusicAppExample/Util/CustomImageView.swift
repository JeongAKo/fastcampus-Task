//
//  CustomImageView.swift
//  UdemyInstargramCopy
//
//  Created by Wi on 09/06/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

var imageCache = [String: UIImage]()


class CustomImageView: UIImageView{
    
//    var lastImgUrlUsedToLoadImage: String?

    func loadImage(with urlString: String){
        
        // set image to nil

        self.image = nil
        
        // set lastImgUrlUsedToLoadImage
//        lastImgUrlUsedToLoadImage = urlString
        
        // check if image exists in cache
        if let cachedImage = imageCache[urlString]{
            self.image = cachedImage
            return
        }
        
        // if image does not exist in cache
        
        // url for image location
        guard let url = URL(string: urlString) else {return}
        
        // fetch contents of URL
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            // handle error
            if let error = error {
                print("Failed to load image wiht error", error.localizedDescription)
            }
            
//            if self.lastImgUrlUsedToLoadImage != url.absoluteString{
//                return
//            }
            
            // image data
            
            guard let imageData = data else {return}
            
            // set image using image data
            
            let photoImage = UIImage(data: imageData)
            
            // set key and value for image cache
            print("ab:",url.absoluteString)
            print("url: ",url)
            imageCache[url.absoluteString] = photoImage
            
            //set image
            
            DispatchQueue.main.async {
                self.image = photoImage
            }
            }.resume()
    }
}

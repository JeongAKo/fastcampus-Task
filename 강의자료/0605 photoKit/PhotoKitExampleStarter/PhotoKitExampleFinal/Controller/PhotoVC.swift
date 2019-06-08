//
//  PhotoVC.swift
//  PhotoKitExampleFinal
//
//  Created by Wi on 04/06/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit
import Photos

private let reuseIdentifier = "PhotoCell"
private let reuseHeaderIndentifier = "PhotoHeader"

class PhotoVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Properties
    
    var images = [UIImage]()
    var assets = [PHAsset]()
    var selectedImage : UIImage?

    
    override func viewDidLoad() {
        super.viewDidLoad()

        

        // Register cell classes
        self.collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        self.collectionView.register(PhotoCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: reuseHeaderIndentifier)
        
        collectionView.backgroundColor = .white
        
        fetchPhotos()
        
    }
    
    // MARK: - UICollectionView

    // MARK: UICollectionViewFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let width = view.frame.width
        
        

        
        return CGSize(width: width, height: width)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - 3) / 4
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    // MARK: UICollctionViewDatasource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PhotoCell else { fatalError("cell type not") }
        cell.photoImageView.image = images[indexPath.row]
        return cell
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: reuseHeaderIndentifier, for: indexPath) as? PhotoCell else {fatalError( "header is not Pho.....")}
        
        if let selectedImage = self.selectedImage {
            
            //인덱스 구하기
            if let index = self.images.index(of: selectedImage) {
                let selectedAsset = self.assets[index]
                
                let imageManager = PHImageManager.default()
                let tagetSize = CGSize(width: 600, height: 600)
                
                imageManager.requestImage(for: selectedAsset, targetSize: tagetSize, contentMode: .default, options: nil) { (image, info) in
                    header.photoImageView.image = image
                }
            }
        }
        
        
        
        return header
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedImage = images[indexPath.row]
        self.collectionView.reloadData()
    }
    
    
    // MARK: - Photos func
    
    func fetchPhotos(){
        //옵션만들기
        let options = PHFetchOptions()
        
        //사진을 몇개까지 가지고 올지 정하기
        options.fetchLimit = 50
        
        //정렬방식
        let sortDescriptor = NSSortDescriptor(key: "creationDate", ascending: true)
        
        //옵션 정렬 지정하기
        options.sortDescriptors = [sortDescriptor]
        DispatchQueue.global(qos: .background).async {
            
            //사진 에셋 가져오기
            let allPhotos = PHAsset.fetchAssets(with: .image, options: options)
            
            allPhotos.enumerateObjects { (asset, count, stop) in
                print(count)
                // 이미지 매니져
                let imageManager = PHImageManager.default()
                
                //사진사이즈
                let targetSize = CGSize(width: 200, height: 200)
                
                //이지지 요청할때 옵션
                let options = PHImageRequestOptions()
                
                //이미지 동기적? 비동기적을 결정하는 변수
                options.isSynchronous = true
                
                //이미지 요청
                imageManager.requestImage(for: asset, targetSize: targetSize, contentMode: .aspectFit, options: options, resultHandler: { (image, info) in
                    if let image = image {
                        
                        //이미지 추가하기
                        self.images.append(image)
                        
                        //select 할때 더 큰 이미지를 요청할 용도
                        self.assets.append(asset)
                        
                        if self.selectedImage == nil {
                            self.selectedImage = image
                        }
                        
                        DispatchQueue.main.async {
                            self.collectionView.reloadData()
                        }
                        print("reload")
                    }
                })
                
            }
            
        }
        
    }
    
}

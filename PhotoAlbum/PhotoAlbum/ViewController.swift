//
//  ViewController.swift
//  PhotoAlbum
//
//  Created by Justin on 2017/7/8.
//  Copyright © 2017年 Justin. All rights reserved.
//

import UIKit
import Photos

class ViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {

    var imagesArray = [UIImage]()
    var headerImage: UIImage?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagesArray.append(#imageLiteral(resourceName: "camera"))
        grabPhoto()
    }
    
    func grabPhoto() {
        
        let imManager = PHImageManager.default()
        
        let requestOptions = PHImageRequestOptions()
        requestOptions.isSynchronous = true
        requestOptions.deliveryMode = .highQualityFormat
        
        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key:"creationDate",ascending:false)]
        
        if let fetchResult : PHFetchResult = PHAsset.fetchAssets(with: .image, options: fetchOptions) {
            if fetchResult.count > 0 {
                
                for i in 0..<fetchResult.count{
                    imManager.requestImage(for: fetchResult.object(at: i) , targetSize: CGSize(width:200, height:200), contentMode: .aspectFill, options: requestOptions, resultHandler: { (image, error) in
                        self.imagesArray.append(image!)
                        self.collectionView?.reloadData()
                    })
                }
                
            }else{
                print("没有获取到图片")
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesArray.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) 
         
        let imageView = cell.viewWithTag(1) as! UIImageView
        
        imageView.image = imagesArray[indexPath.row]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        var headerView : UICollectionReusableView!
        
        if kind == UICollectionElementKindSectionHeader {
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "reusableView", for: indexPath)
            headerView = view
            
            let imageView = headerView.viewWithTag(2) as! UIImageView
            imageView.image = headerImage == nil ?imagesArray[1]:headerImage!
        }
        return headerView
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row != 0 {
            headerImage = imagesArray[indexPath.row];
            collectionView.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        let width = collectionView.bounds.size.width
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.size.width/4 - 1
        
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0;
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0;
    }

}


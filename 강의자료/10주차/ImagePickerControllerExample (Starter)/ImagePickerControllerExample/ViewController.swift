//
//  ViewController.swift
//  ImagePickerControllerExample
//
//  Created by giftbot on 2019. 5. 3..
//  Copyright © 2019년 giftbot. All rights reserved.
//

import MobileCoreServices
import UIKit

final class ViewController: UIViewController {

  @IBOutlet private weak var imageView: UIImageView!
  private let imagePickerController = UIImagePickerController()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    imagePickerController.delegate = self
  }
  
  @IBAction private func pickImage(_ sender: Any) {
    imagePickerController.sourceType = .photoLibrary
    print("\n---------- [ pickImage ] ----------\n")
    
    present(imagePickerController, animated: true)
  }
  
  
  @IBAction private func takePicture(_ sender: Any) {
    guard UIImagePickerController.isSourceTypeAvailable(.camera)
        else {return}
    imagePickerController.sourceType = .camera
    
    print(imagePickerController.mediaTypes)
    
    imagePickerController.mediaTypes = [kUTTypeImage as String]
//    imagePickerController.mediaTypes = ["public.image"]
    
//    let mediaTypes = UIImagePickerController.availableMediaTypes(for: .camera)
//    imagePickerController.mediaTypes = mediaTypes ?? []
    
    present(imagePickerController, animated: true)
    
    print("\n---------- [ takePicture ] ----------\n")
  }
  
  @IBAction private func takePictureWithDelay(_ sender: Any) {
    print("\n---------- [ takePictureWithDelay ] ----------\n")
    
    guard UIImagePickerController.isSourceTypeAvailable(.camera) else {return}
    imagePickerController.sourceType = .camera
    imagePickerController.mediaTypes = [kUTTypeImage as String]
    present(imagePickerController, animated: true) {
//        self.imagePickerController.takePicture()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2 ,execute: {self.imagePickerController.takePicture()})
    }
  }
  
  
  @IBAction private func recordingVideo(_ sender: Any) {
    print("\n---------- [ recordingVideo ] ----------\n")
    guard UIImagePickerController.isSourceTypeAvailable(.camera) else {return}
    imagePickerController.sourceType = .camera
    print(imagePickerController.mediaTypes)
    imagePickerController.mediaTypes = [kUTTypeMovie as String]

//    imagePickerController.mediaTypes = ["public.movie"] ↑쌤쌤
//    imagePickerController.cameraDevice = .front
    
    let mediaTypes = UIImagePickerController.availableMediaTypes(for: .camera)
    imagePickerController.mediaTypes = mediaTypes ?? []
    imagePickerController.cameraCaptureMode = .video
    
    present(imagePickerController, animated: true)
    
//    imagePickerController.startVideoCapture()
//    imagePickerController.stopVideoCapture()
  }

  @IBAction private func toggleAllowsEditing(_ sender: Any) {
    print("\n---------- [ toggleAllowsEditing ] ----------\n")

    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let mediaYpe = info[.mediaType] as! NSString
        if UTTypeEqual(mediaYpe, kUTTypeImage) {
        let originalImage = info[.originalImage] as! UIImage
        let editingImage = info[.editedImage] as? UIImage
        let selectedImage = editingImage ?? originalImage
        imageView.image = selectedImage
            
            if picker.sourceType == .camera {
                UIImageWriteToSavedPhotosAlbum(selectedImage, nil, nil, nil)
            }
        
        } else if UTTypeEqual(mediaYpe, kUTTypeMovie) {
            if let mediaPath = (info[.mediaURL] as? NSURL)?.path, UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(mediaPath) {
                UISaveVideoAtPathToSavedPhotosAlbum(mediaPath, nil, nil, nil)
                
            }
        }
        picker.dismiss(animated: true)
    }
}

//
//  ViewController.swift
//  Simple Camera
//
//  Created by RAMDHAN CHOUDHARY on 14/05/19.
//  Copyright © 2019 RDC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: Variables, Instance declearations
    @IBOutlet weak var imageView: UIImageView! //Declear ImageView IBOutlet so we can show after capturing
    var imagePickerConroller: UIImagePickerController! //Declear ImagePickerController which will open camra
    
    
    
    
    // MARK: View Controller life cycle methods
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // TODO: Please make sure you add Camera privacy permission key in .plist file. key is "Privacy - Camera Usage Description" value is "This application needs to use the of the device"
    }
    
    
    // MARK: Button action method
    
    //Start Camera - method is soul of the programme, it create camera instance and confirm its delegate methods
    @IBAction func startCamera(_ sender: Any)
    {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            imagePickerConroller = UIImagePickerController()
            imagePickerConroller.delegate = self;
            imagePickerConroller.sourceType = .camera
            self.present(imagePickerConroller, animated: true, completion: nil)
        }
    }
    
    
    
    // MARK: Camera Delegate Methods

    //This method will get called when user capture photo, and it will return caputered image and meta data
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        picker.dismiss(animated: true, completion: nil)
        imageView.image = info[.originalImage] as? UIImage
    }
    
    //This method will get called if use cancel camera
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        picker.dismiss(animated: true, completion: nil)
    }

}


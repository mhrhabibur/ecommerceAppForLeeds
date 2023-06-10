//
//  AccountViewController.swift
//  eCommerce Application
//
//  Created by Habibur Rahman on 6/6/23.
//

import UIKit

class ProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var profilePictureImageView: UIImageView!
    private let imagePicker = UIImagePickerController()
    private var selectedImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profilePictureUpload()

        title = "Account"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "History", style: .done, target: self, action: #selector(showHistory))
    }
    
    @objc func showHistory() {
        print("History")
    }
    

    @IBAction func uploadProfilePicture(_ sender: UIButton) {
        
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    func profilePictureUpload() {
        imagePicker.delegate = self
        profilePictureImageView.layer.cornerRadius = 100
        profilePictureImageView.layer.masksToBounds = true
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            selectedImage = pickedImage
            profilePictureImageView.image = selectedImage
            dismiss(animated: true)

        }
    }
    
}

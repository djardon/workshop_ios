//
//  DetailViewController.swift
//  FriendsApp
//
//  Created by David Jardon on 23/11/20.
//

import UIKit

class DetailViewController: UIViewController {
    var friend: Friend? = nil
    
    @IBOutlet var friendImage: UIImageView?
    @IBOutlet var name: UITextField?
    @IBOutlet var lastname: UITextField?
    @IBOutlet var level: UISlider?
    @IBOutlet var levelValue: UILabel?

    @IBAction func onSavePressed(_ sender: UIBarButtonItem) {
        if let friendData = friend {
            friendData.image = friendImage?.image
            friendData.name = name?.text ?? ""
            friendData.lastname = lastname?.text ?? ""
            friendData.level = level?.value ?? 0
        } else {
            Friends.shared.friends.append(Friend(image: friendImage?.image,
                                                 name: name?.text ?? "",
                                                 lastname: lastname?.text ?? "",
                                                 level: level?.value ?? 0))
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onLevelChanged(_ sender: UISlider) {
        levelValue?.text = String(format: "%.1f", sender.value)
    }
    
    private var pickerController: UIImagePickerController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
    
    private func configureViews() {
        pickerController = UIImagePickerController()
        pickerController?.delegate = self
        pickerController?.allowsEditing = true
        pickerController?.mediaTypes = ["public.image"]
        pickerController?.sourceType = .photoLibrary
        
        friendImage?.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                                 action: #selector(onImagePressed)))
        
        friendImage?.image = friend?.image ?? UIImage(named: "friend_image_default")
        name?.text = friend?.name
        lastname?.text = friend?.lastname
        level?.value = friend?.level ?? 0.0
        levelValue?.text = String(format: "%.1f", friend?.level ?? 0.0)
    }
    
    @objc func onImagePressed() {
        guard let pickerImage = pickerController else {
            return
        }
        
        self.present(pickerImage,
                     animated: true,
                     completion: nil)
    }
}

extension DetailViewController {
     private func pickerController(_ controller: UIImagePickerController, didSelect image: UIImage?) {
        controller.dismiss(animated: true, completion: nil)
        friendImage?.image = image
     }
}


extension DetailViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        pickerController(picker, didSelect: nil)
    }
    
    public func imagePickerController(_ picker: UIImagePickerController,
                                      didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        guard let image = info[.editedImage] as? UIImage else {
            return pickerController(picker, didSelect: nil)
        }
        
        pickerController(picker, didSelect: image)
    }
}

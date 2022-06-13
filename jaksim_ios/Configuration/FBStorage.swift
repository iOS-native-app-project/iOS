//
//  FBStorage.swift
//  jaksim_ios
//
//  Created by Apple on 2022/06/09.
//

import Foundation
import Kingfisher
import FirebaseStorage

struct FBStorage {
    static var shared: FBStorage = FBStorage()
    
    private init() {}

    let storage = Storage.storage()
    
    func upLoadImage(img: UIImage, path: String, completion: @escaping () -> Void){
        var data = Data()
        data = img.jpegData(compressionQuality: 0.8)!
        let filePath = path
        let metaData = StorageMetadata()
        metaData.contentType = "image/png"
        storage.reference().child(filePath).putData(data, metadata: metaData){
            (metaData,error) in if let error = error {
                print("이미지 업로드 실패: \(error)")
                return
            }else{
                completion()
                print("이미지 업로드 성공")
            }
        }
    }
    
    func downLoadImage(path: String, setImage: @escaping (UIImage) -> Void) {
        storage.reference(forURL: path).downloadURL(completion: { (url, error) in
            
            print()
            let data = NSData(contentsOf: url!)
            let image = UIImage(data: data! as Data)
            
            setImage(image!)
        })
    }
}

extension UIImageView {
    func setImage(path: String) {
        let cache = ImageCache.default
        cache.retrieveImage(forKey: path, options: nil) { result in
            switch result {
            case .success(let value):
                if let image = value.image {
                    self.image = image
                } else {
                    FBStorage.shared.storage.reference(forURL: path).downloadURL(completion: { (url, error) in
                        if let error = error {
                            print("An error has occured: \(error.localizedDescription)")
                            return
                        }
                        guard let url = url else {
                            return
                        }
                        self.kf.setImage(with: url)
                    })
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

//
//  FBStorage.swift
//  jaksim_ios
//
//  Created by Apple on 2022/06/09.
//

import Foundation
import FirebaseStorage

class FBStorage {
    
    let storage = Storage.storage() //인스턴스 생성
    var downloadImage: UIImage?
    
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
    
    func downLoadImage(path: String, setImage: @escaping () -> Void) {
        storage.reference(forURL: path).downloadURL(completion: { (url, error) in
            let data = NSData(contentsOf: url!)
            let image = UIImage(data: data! as Data)
                                    
            self.downloadImage = image
            setImage()
        })
    }
}

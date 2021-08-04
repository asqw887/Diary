//
//  AddDiaryViewController.swift
//  Diary
//
//  Created by 최예주 on 2021/08/03.
//

import UIKit
import MobileCoreServices

class AddDiaryViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate{
    
    

    @IBOutlet var imgView: UIImageView!
    @IBOutlet var diaryTextField: UITextField!
    @IBOutlet var titleLabel: UILabel!
    
    
    // UIImagePickerController의 인스턴스 변수 생성
    let imagePicker: UIImagePickerController! = UIImagePickerController()
    var fromLibraryImage: UIImage!
   
    
    
   


    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        diaryTextField.delegate = self
        
        
        // 현재 날짜 구해서 포맷팅, string 으로 변환후 label에 띄우기
        let nowTime = Date()
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyyy.MM.dd"
        let convertNowString = dateFormat.string(from: nowTime)
        
        titleLabel.text = convertNowString+" 일기를 써보자 :)"
        
        
//        print(convertNowStr)
        
        
        

        // Do any additional setup after loading the view.
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
    
    // MARK: - IBAction
    
    // 라이브러리에서 사진을 가져와 imageView에 로드할 이벤트
    @IBAction func loadImageFromLibraryButton(_ sender: Any) {
        if (UIImagePickerController.isSourceTypeAvailable(.photoLibrary)){
            
            
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.mediaTypes = [kUTTypeImage as String]
            imagePicker.allowsEditing = true
            
            present(imagePicker, animated: true, completion: nil)
            
        }
        
        else {
            
            myAlert("Photo album inaccessable", message: "접근할 수 없어요... ")
            
        }
        
        
        
        
    }
    
    
    
    
    
    // 완료 버튼을 클릭했을 때 이벤트
    // 이미지와 텍스트필드를 전달해주고 이전 뷰로 돌아가야함
    // + date는 그냥 뷰 열릴때 date를 label 로 잡아서 넘겨줄까?,,
    @IBAction func touchUpdateButton(_ sender: UIButton) {
        
        // 리스트에 append
        diarycontent.append(diaryTextField.text!)
        diaryimages.append(fromLibraryImage)
        
        // 썼던 내용을 지워줌
        diaryTextField.text = ""
        
        // 현재 view는 pop
        _ = navigationController?.popViewController(animated: true)
    }
    
    
    
    
    
    func myAlert(_ title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    // MARK: - imagePicekr Delegate
    
    // 델리게이트 구현
    
    // 사진 선택완료했을때 실행할 메소드
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        // 가져온거 미디어타입 확인
        let mediaType = info[UIImagePickerController.InfoKey.mediaType] as! NSString
        
        
        if mediaType.isEqual(to: kUTTypeImage as NSString as String) {
            
            // crop된 이미지를 가져오도록 함
            fromLibraryImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
            
            // 이미지 뷰에 가져온 originalImage를 띄움
            imgView.image = fromLibraryImage
            
            
        }
        
        // 화면에서 피커화면을 dismiss
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    // 사진 선택을 취소했을 때 실행할 메소드
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: - TextField Delegate
    
    // 텍스트필드 델리게이트
    // 다 입력했고 리턴키 누르면 키보드가 내려갈 수 있도록
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        diaryTextField.resignFirstResponder()
        return true
    }
    
    
    // todo == 키보드가 올라오면서 화면을 가리는 현상을 해결해야함 ..!
}

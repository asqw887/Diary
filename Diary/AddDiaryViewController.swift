//
//  AddDiaryViewController.swift
//  Diary
//
//  Created by 최예주 on 2021/08/03.
//

import UIKit
import MobileCoreServices


// 사진을 가져오기 위한 UINavigationControllerDelegate, UIImagePickerControllerDelegate Delegate
// UITextViewDelegate
class AddDiaryViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextViewDelegate{
    
    
    // 여러줄을 쓸때는 textView를 써야하는구나..
    
    @IBOutlet var diaryTextView: UITextView!
    @IBOutlet var imgView: UIImageView!
//    @IBOutlet var diaryTextField: UITextField!
    @IBOutlet var titleLabel: UILabel!
    
    
    
    // UIImagePickerController의 인스턴스 변수 생성
    let imagePicker: UIImagePickerController! = UIImagePickerController()
    var fromLibraryImage: UIImage! // 라이브러리에서 가져온 이미지를 담을 변수
    var todayDate: String! // 날짜를 담을 변수
   
    
    
   


    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // placeholder 기본 셋팅
        placeholderSetting()
        
        
        // 현재 날짜 구해서 포맷팅, string 으로 변환후 label에 띄우기
        let nowTime = Date()
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyyy.MM.dd"
        let convertNowString = dateFormat.string(from: nowTime)
        todayDate = convertNowString  //  다른 뷰컨트롤러에서 쓰기위해  String으로 변환한 날짜를 todayDate에 저장
        
        titleLabel.text = convertNowString+" 일기를 써보자 :)"
        
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
        if (UIImagePickerController.isSourceTypeAvailable(.photoLibrary)){ // 라이브러리 사용가능 여부 확인
            
            
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary // 이미지 피커의 소스타입을 라이브러리로 설정
            imagePicker.mediaTypes = [kUTTypeImage as String] // 미디어 타입을 kUTTypeImage로 설정
            imagePicker.allowsEditing = true // 편집 허용
            
            present(imagePicker, animated: true, completion: nil) // 현재 뷰에 imagePicker present
            
        }
        
        else {
            
            myAlert("Photo album inaccessable", message: "접근할 수 없어요... ")  // 접근할 수 없는 경고창 띄우기
            
        }
        
        
        
        
    }
    
    
    
    
    
    // 완료 버튼을 클릭했을 때 이벤트
    // 이미지와 텍스트필드를 전달해주고 이전 뷰로 돌아가야함
    @IBAction func touchUpdateButton(_ sender: UIButton) {
        // 이미지/내용을 입력했는지 확인
        if ((diaryTextView.text?.isEmpty == true)){ // textfield가 비어있는지 확인
            myAlert("앗..!", message: "일기 내용을 입력주세요") // alert 띄워주기
            
        }
        
        else if (fromLibraryImage == nil){
          
            myAlert("앗..!", message: "이미지를 넣어주세요") // alert 띄워주기
            return
        }
        
        // 둘다 잘 입력되어있을 경우
        else {
        
        // 리스트에 append
            diarys.append(Diary(diaryContent: diaryTextView.text!, diaryImages: fromLibraryImage, diaryDate: todayDate))
//        diarycontent.append(diaryTextView.text!)
//        diaryimages.append(fromLibraryImage)
//        diaryDateList.append(todayDate)
        
        // 썼던 내용을 지워줌
        diaryTextView.text = ""
        
        // 현재 view는 pop
        _ = navigationController?.popViewController(animated: true)
        }
    }
    
    
    
    
    
    // 얼럿을 띄워줄 메소드
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
    // todo - placeholder
    
    
    
    // 편집을 시작했을 때
    func textViewDidBeginEditing(_ textView: UITextView){
        if diaryTextView.textColor == UIColor.lightGray {
            diaryTextView.text = nil
            diaryTextView.textColor = UIColor.black
            
        }
        
    }
    
    // 텍스트필드 델리게이트
    // 다 입력했고 리턴키 누르면 키보드가 내려갈 수 있도록
    // 편집이 끝났을 때
    func textViewDidEndEditing(_ textView: UITextView) {
        diaryTextView.resignFirstResponder()  // 키보드 내려가게
        
        if diaryTextView.text.isEmpty {
            diaryTextView.text = "내용을 입력해주세요"
            diaryTextView.textColor = UIColor.lightGray
            
        }

    }
    
    // 다른 화면을 터치했을 때 키보드가 내려갈 수 있는 메소드
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)

   }
    
    
    // placeholder 기본 셋팅
    func placeholderSetting() {
        diaryTextView.delegate = self // TextView delegate 설정
        diaryTextView.text = "내용을 입력해주세요"
        diaryTextView.textColor = UIColor.lightGray
        
            
    }



    

    // todo == 키보드가 올라오면서 화면을 가리는 현상을 해결해야함 ..!
    
    
}

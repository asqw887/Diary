//
//  AlbumViewController.swift
//  Diary
//
//  Created by 최예주 on 2021/08/05.
//

import UIKit



class AlbumViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

 
    //콜렉션 뷰 
    @IBOutlet var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        collectionView.reloadData()   // 콜렉션 뷰를 다시 업데이트
    }
    
    
    //UICollectionViewDataSource
    // 몇개를 보여줄지
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return diarycontent.count
    }
    
    
    // 셀은 어떻게 표현할 지
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                
        
        //
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AlbumCell", for: indexPath) as? AlbumCell else {
            return UICollectionViewCell()
        }
    
        cell.dateLabel?.text = diaryDateList[(indexPath as NSIndexPath).row]
        cell.imgView?.image = diaryimages[(indexPath as NSIndexPath).row]
        return cell
        
        
    }
    //UICollectionViewDelegate
    //셀을 클릭했을때 어떻게 할건지
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    
    
    //UICollectionViewDelegateFlowLayout
    // 셀 사이즈 계산 (  다양한 디바이스에서 일관적인 디자인을 보여주려고 )
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    

}


// 커스텀셀 --> 테이블뷰 셀도 이렇게 바꾸는게 좋을 거 같다
class AlbumCell: UICollectionViewCell {
    
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var dateLabel: UILabel!
}

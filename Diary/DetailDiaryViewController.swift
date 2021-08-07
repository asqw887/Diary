//
//  DetailDiaryViewController.swift
//  Diary
//
//  Created by 최예주 on 2021/08/03.
//

import UIKit

class DetailDiaryViewController: UIViewController {

    
    var receiveContent = ""
    var receiveImage = UIImage()
    var receiveDate = ""
    
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var DailyContentLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DailyContentLabel.text = receiveContent
        imgView.image = receiveImage
        dateLabel.text = receiveDate
        

        // Do any additional setup after loading the view.
    }
    
    
    
    
    func receiveItem(_ item: String){
        receiveContent = item
    }
    
    func receiveImage(_ item: UIImage){
        receiveImage = item
    }
    
    func receiveDate(_ item: String){
        receiveDate = item
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  Data.swift
//  Diary
//
//  Created by 최예주 on 2021/08/08.
//

import UIKit

// Model
struct Diary {
    var diaryContent: String?
    var diaryImages: UIImage?
    var diaryDate: String?
}


// 모델로 mvc패턴 구현해서 만들기 
var diarys:[Diary] = [
    Diary(diaryContent: "happy day....", diaryImages: UIImage(named: "너굴맨1.jpeg"), diaryDate: "2019.05.31"),
    Diary(diaryContent: "study... ", diaryImages: UIImage(named: "너굴맨2.jpeg"), diaryDate: "2019.06.01"),
    Diary(diaryContent: "trip 1 day...", diaryImages: UIImage(named: "1.jpg"), diaryDate: "2019.06.02"),
    Diary(diaryContent: "trip 2 day...", diaryImages: UIImage(named: "2.jpg"), diaryDate: "2019.06.03"),
    Diary(diaryContent: "trip 3 day...", diaryImages: UIImage(named: "3.jpg"), diaryDate: "2019.06.05"),
    Diary(diaryContent: "trip 4 day...", diaryImages: UIImage(named: "4.jpg"), diaryDate: "2019.06.31"),
    Diary(diaryContent: "trip 5 day...", diaryImages: UIImage(named: "5.jpg"), diaryDate: "2019.07.10"),
    Diary(diaryContent: "trip 6 day...", diaryImages: UIImage(named: "6.jpg"), diaryDate: "2019.07.12"),
    Diary(diaryContent: "trip 7 day...", diaryImages: UIImage(named: "7.jpg"), diaryDate: "2019.07.13"),
    Diary(diaryContent: "trip 8 day...", diaryImages: UIImage(named: "8.jpg"), diaryDate: "2019.07.14"),
    Diary(diaryContent: "trip 9 day...", diaryImages: UIImage(named: "9.jpg"), diaryDate: "2019.07.15")
]


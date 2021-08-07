//
//  DiaryListViewControllerTableViewController.swift
//  Diary
//
//  Created by 최예주 on 2021/08/03.
//

import UIKit



class DiaryListViewControllerTableViewController: UITableViewController {

    @IBOutlet var diaryTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        diaryTableView.reloadData()   // 테이블 뷰를 다시 업데이트
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        // diarycontent 리스트 갯수만큼 tablecell 보여주기 ^-^
        return diarycontent.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "DiaryCell", for: indexPath)

        
        
        // 일단 보여줄게 없으니까 content 꺼내주고 date로 바꾸자
        cell.textLabel?.text = diaryDateList[(indexPath as NSIndexPath).row]
        cell.imageView?.image = diaryimages[(indexPath as NSIndexPath).row]
        

    

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // 디테일뷰로 넘어가는 세그웨이 인지 확인
        if segue.identifier == "detailSG"{
            
            let cell = sender as! UITableViewCell
            let indexPath = self.diaryTableView.indexPath(for: cell)
            let detailView = segue.destination as! DetailDiaryViewController
            detailView.receiveItem(diarycontent[(indexPath! as NSIndexPath).row])
            detailView.receiveImage(diaryimages[(indexPath! as NSIndexPath).row])
            detailView.receiveDate(diaryDateList[(indexPath! as NSIndexPath).row])
            
        }
        
    }
}



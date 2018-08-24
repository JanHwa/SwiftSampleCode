//
//  ViewController.swift
//  iCloudKit
//
//  Created by HWA on 2018/8/24.
//  Copyright © 2018年 HWA. All rights reserved.
//

import UIKit
import CloudKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var refreshControl: UIRefreshControl? = nil
    
    var books = [CKRecord]()

    let publicDB = CKContainer.default().publicCloudDatabase
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(loadData), for: .valueChanged)
        
        tableView.refreshControl = refreshControl
        
        loadData()
    }

    @IBAction func addButton(_ sender: UIBarButtonItem) {
        showAlertController()
    }
    
    
    @objc func loadData() -> Void {
        let query = CKQuery(recordType: "Book", predicate: NSPredicate(format: "TRUEPREDICATE", argumentArray: nil))
        query.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        
        publicDB.perform(query, inZoneWith: nil) { [weak self](records: [CKRecord]?, error) -> Void in
            guard let records = records else {return}
            self?.books = records
            
            DispatchQueue.main.async {
                self?.tableView.reloadData()
                self?.refreshControl?.endRefreshing()
            }
            }
    }
    
    
    /// 删除数据
    ///
    /// - Parameter indexPath: 本地数据索引
    func deleteData(_ indexPath:IndexPath) -> Void {
        
        publicDB.delete(withRecordID: books[indexPath.row].recordID) { (recordId, error) in
            if error == nil {
                DispatchQueue.main.async {
                    self.books.remove(at: indexPath.row)
                    self.tableView.deleteRows(at: [indexPath], with: .left)
                }
            }
        }
    }
    
    
    /// 添加数据
    ///
    /// - Parameters:
    ///   - bookName: 书名
    ///   - author: 作者
    func addData(_ bookName:String, author:String) -> Void {
        
        let bookID = CKRecordID(recordName: bookName)
        let book = CKRecord(recordType: "Book", recordID: bookID)
        book.setValue(bookName, forKey: "bookName")
        book.setValue(author, forKey: "author")
        
        publicDB.save(book) { [weak self]savedRecord , error in
            if error == nil {
                print("success")
                
                self?.books.insert(savedRecord!, at: 0)
                let indexPath = IndexPath(row: 0, section: 0)
                
                DispatchQueue.main.async {
                    self?.tableView.insertRows(at: [indexPath], with: .top)
                    self?.tableView.endUpdates()
                }
                
            }
        }
    }
    
    func showAlertController() -> Void {
        let alertController = UIAlertController(title: "添加书本", message: "请输入书本信息", preferredStyle: .alert)
        
        alertController.addTextField { (textField) in
            textField.placeholder = "书本名"
        }
        
        alertController.addTextField { (textField) in
            textField.placeholder = "作者名"
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            print("Cancel")
        }
        
        let okAction = UIAlertAction(title: "Ok", style: .default) { [weak self](action) in
            print("OK")
            
            guard let textFields = alertController.textFields else {return}
            
            guard let bookName = textFields.first?.text else {return}
            
            guard let author = textFields.last?.text else {return}
            
            self?.addData(bookName, author: author)
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let bookName = books[indexPath.row].value(forKey: "bookName") as! String
        let author = books[indexPath.row].value(forKey: "author") as! String
        
        cell.textLabel?.text = bookName
        cell.detailTextLabel?.text = "作者：" + author
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        self.deleteData(indexPath)
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}


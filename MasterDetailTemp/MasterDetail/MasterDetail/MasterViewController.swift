//
//  MasterViewController.swift
//  MasterDetail
//
//  Created by lecture on 2018. 4. 23..
//  Copyright © 2018년 lecture. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var objects = [Any]()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.leftBarButtonItem = editButtonItem

        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
        navigationItem.rightBarButtonItem = addButton
        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc
    func insertNewObject(_ sender: Any) {
        objects.insert(NSDate(), at: 0)
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let object = objects[indexPath.row] as! NSDate
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = object
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View
    //table view의 data source는 우리가 원하는 데이터를 뿌리기 위해서 원하는 값을 정해주면 알맞게 뿌려준다..
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2//몇개의 섹션을 준비해야하는가?
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {//섹션이 1개면 '0' 한번만 호출이 된다. 10 이면 0~9
        return 4//즉, 몇개의 로우가 필요한가 (objects.count) !! 임의로 정의해줘도 된다.
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {//뷰 오브젝트. 여기서 만들어서 리턴을 한다.
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

       // let object = objects[indexPath.row] as! NSDate //data 확보 코드
        // cell.textLabel!.text = object.description //확보한 data를 뿌린다.
        cell.textLabel!.text = "HELLO HAHA"//확보한 데이터 대신 그냥 아무거나 뿌림
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            objects.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }


}


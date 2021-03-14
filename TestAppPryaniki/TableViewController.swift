//
//  TableViewController.swift
//  TestAppPryaniki
//
//  Created by User on 12.03.2021.
//

import UIKit

protocol tableViewDelegate{
    func present<T: UIViewController>(alert: T)
}

class TableViewController: UITableViewController, tableViewDelegate {
        var model = PryanikiModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = L10n.testApp
        tableView.backgroundColor = #colorLiteral(red: 0.8923428655, green: 0.8870386481, blue: 0.8964203596, alpha: 1)
        model.delegate = self
        bindModel()
        model.loadData {[weak self] (alert) in
            self?.present(alert, animated: true, completion: nil)
        }
        tableView.register(UINib(nibName: L10n.hzId,
                                 bundle: nil), forCellReuseIdentifier: L10n.hzId)
        tableView.register(UINib(nibName: L10n.pictureId,
                                 bundle: nil), forCellReuseIdentifier: L10n.pictureId)
        tableView.register(UINib(nibName: L10n.segmentCellId, bundle: nil),
                           forCellReuseIdentifier: L10n.segmentCellId)
    }
    
    func bindModel(){
        self.model.itemList.bind(to: self){[weak self](strongSelf, data) in
            guard let self = self else {return}
            self.tableView.reloadData()
        }
    }
    
    func present<T: UIViewController>(alert: T){
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Table view data source
        override func numberOfSections(in tableView: UITableView) -> Int {
            model.itemList.value.count
        }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       1
    }

    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = model.cellConfigure(indexPath: indexPath, tableView: tableView)
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = model.itemList.value[indexPath.section]
        let alert = AlertController.getAlert(title: L10n.info,
                                             message: L10n.initObj + item,
                                             cancelButton: false ) {
        if item == L10n.picture{
            self.model.showImage(tableView: tableView, indexPath: indexPath)
            }
            return ()
        }
        present(alert, animated: true, completion: nil)
    }

}

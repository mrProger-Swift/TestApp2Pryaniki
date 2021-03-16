//
//  PryanikiModel.swift
//  TestAppPryaniki
//
//  Created by User on 11.03.2021.
//
import UIKit
import SimpleImageViewer
import Bond

class PryanikiModel: segmentedControllDelegate{
    
    var parseManager = ParseManager()
    var itemList = Observable<[String]>([])
    var itemData: [Sample] = []
    var delegate : tableViewDelegate!
    
    func loadData(alerts: @escaping(UIAlertController) -> ()){
        parseManager.parseJson(urlString: Constants.url,
                               model: PryanikiResponceModel.self) { [weak self] (responce) in
            self?.itemData = responce.data
            self?.itemList.value = responce.view
        } error: {  (error) in
            let alert = AlertController.getAlert(title: L10n.error,
                                                 message: error.localizedDescription,
                                                 cancelButton: false) {}
            alerts(alert)
        }
    }
    
    func cellConfigure(indexPath: IndexPath, tableView: UITableView) -> UITableViewCell{
        let item = itemList.value[indexPath.section]
        guard let cellInfo = itemData.first(where: { (response) -> Bool in
            return response.name == item
        }) else {
            return UITableViewCell()
        }
        switch item {
        case L10n.hz:
            let cell = tableView.dequeueReusableCell(withIdentifier: L10n.hzId,
                                                     for: indexPath) as! HzTableViewCell
            cell.cellConfigure(data: cellInfo.data)
            return cell
        case L10n.picture:
            let cell = tableView.dequeueReusableCell(withIdentifier: L10n.pictureId,
                                                     for: indexPath) as! PictureTableViewCell
            cell.cellConfigure(data: cellInfo.data)
            return cell
        case L10n.selector:
            let cell = tableView.dequeueReusableCell(withIdentifier: L10n.segmentCellId,
                                                     for: indexPath) as! SegmentTableViewCell
            cell.delegate = self
            cell.cellConfigure(data: cellInfo.data)
            return cell
        default:
            return UITableViewCell() 
        }
    }
    func showImage(tableView: UITableView, indexPath: IndexPath){
        let cell = tableView.cellForRow(at: indexPath) as! PictureTableViewCell
        let images = cell.pictureImageView
        let conf = ImageViewerConfiguration { (image) in
            image.image = images?.image}
        let imageVC = ImageViewerController(configuration: conf)
        delegate.present(alert: imageVC)
    }
    
    func segmentChosen ( _ selector: UISegmentedControl, label: UILabel) {
        if let selectorVariants = itemData[2].data.variants {
            switch selector.selectedSegmentIndex {
            case 0: label.text = selectorVariants[0].text;
                let alert = AlertController.getAlert(title: L10n.selector,
                                                     message: selectorVariants[0].text,
                                                     cancelButton: false) {}
                delegate.present(alert: alert)
            case 1: label.text = selectorVariants[1].text
                let alert = AlertController.getAlert(title: L10n.selector,
                                                     message: selectorVariants[1].text,
                                                     cancelButton: false) {}
                delegate.present(alert: alert)
            case 2: label.text = selectorVariants[2].text
                let alert = AlertController.getAlert(title: L10n.selector,
                                                     message: selectorVariants[2].text,
                                                     cancelButton: false) {}
                delegate.present(alert: alert)
            default: break
            }
        }
    }
}

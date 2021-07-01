//
//  ViewController.swift
//  GM Coding Challenge - Lawson
//
//  Created by ravebizz on 6/29/21.
//

import UIKit

class ViewController: UIViewController {
    
    var musicViewModel: MusicViewModel?
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBAction func searchButton(_ sender: Any) {
        createSpinnerView()
        updateData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func updateData() {
        let artistName = searchTextField.text ?? ""
        musicViewModel = MusicViewModel(artistName: artistName) { musicModel in
            if let musicModel = musicModel {
                self.pushToTableVC(with: musicModel)
            }
        }
    }
    
    func pushToTableVC(with musicModel: MusicModel) {
        let tableViewVCStoryboard = UIStoryboard(name: "TableView", bundle: .main)
        guard let vc = tableViewVCStoryboard.instantiateViewController(identifier: "TableView") as? TableViewController else {
            return
        }
        vc.searchViewModel = SearchViewModel(musicModelData: musicModel)
        vc.title = searchTextField.text ?? ""
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func createSpinnerView() {
        let child = SpinnerViewController()
        
        addChild(child)
        child.view.frame = view.frame
        view.addSubview(child.view)
        child.didMove(toParent: self)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            child.willMove(toParent: nil)
            child.view.removeFromSuperview()
            child.removeFromParent()
        }
    }


}


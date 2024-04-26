//
//  ChooseMelodyController.swift
//  ClockApplication
//
//  Created by Ivan Basov on 24.04.24.
//

import UIKit

class ChooseMelodyController: UIViewController {

    let table = OptionalTableView()
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .grayBackground
         setTitle(title: "Melody")
        let button = UIBarButtonItem()
        button.title = "Back"
     //   navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
         navigationItem.backButtonTitle = "Back"
        // Do any additional setup after loading the view.
    }

}

extension ChooseMelodyController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}

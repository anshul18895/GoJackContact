//
//  ViewController.swift
//  GoJackPractical
//
//  Created by admin on 12/02/20.
//  Copyright © 2020 anshul shah. All rights reserved.
//

import UIKit
import Combine


class ViewController: UIViewController {

    var cancellable: [AnyCancellable] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = APIManager.shared.response(from: .getContacts, parseTo: [GJContact].self)?
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }, receiveValue: { contacts in
                print(contacts.map({$0.lastName}))
            }).store(in: &self.cancellable)
        // Do any additional setup after loading the view.
    }
}

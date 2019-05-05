//
//  ViewController.swift
//  DecodableWhenKeysAreUnknow
//
//  Created by Dimic Milos on 5/5/19.
//  Copyright © 2019 Dimic Milos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    let json = """
    {
        "BTC_BCN":{
            "last":"0.00000057",
            "percentChange":"0.03636363",
            "baseVolume":"47.08463318"
        },
        "BTC_BELA":{
            "last":"0.00001281",
            "percentChange":"0.07376362",
            "baseVolume":"5.46595029"
        }
    }
    """.data(using: .utf8)!
    
    struct Pair {
        let name: String
        let details: Details
        
        struct Details: Codable {
            let last, percentChange, baseVolume: String
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        decode()
    }
    
    func decode() {
        if let pairsDictionary = try? JSONDecoder().decode([String: Pair.Details].self, from: json) {
            
            var pairs: [Pair] = []
            for (name, details) in pairsDictionary {
                let pair = Pair(name: name, details: details)
                pairs.append(pair)
            }
            
            print(pairs)
        }
    }


}


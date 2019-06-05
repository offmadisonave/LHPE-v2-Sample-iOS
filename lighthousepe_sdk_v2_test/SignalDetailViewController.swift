//
//  SignalDetailViewController.swift
//  lighthousepe_sdk_v2_test
//
//  Created by Erik Madsen on 6/5/19.
//  Copyright © 2019 Erik Madsen. All rights reserved.
//

import UIKit
import LighthouseKit
import WebKit

class SignalDetailViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    var signal: LHSignal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(signal?.id)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        webView.load(Lighthouse.urlRequest(forSignalId: signal?.id))
    }
    
}

extension SignalDetailViewController: WKNavigationDelegate {
    
}

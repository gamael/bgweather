//
//  HelpVC.swift
//  bgweather
//
//  Created by Alejandro Agudelo on 12/10/20.
//  Copyright © 2020 Alejandro Agudelo. All rights reserved.
//

import UIKit
import WebKit

class HelpVC: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    private struct Constants {
        static let webContent = """
<p><strong>Welcome to BG Weather</strong></p>
        <p>It's a very simple app to use.</p>
        <ol>
        <li>In the search tab you will see a map where you can long press to drop a pin on the map. Such pin will be user as a location spot to show the current weather there in the locations tab.</li>
        <li>Here you can see the list of all previously saved pins. Just tap on to see the current weather. Swipe left to delete a location.</li>
        </ol>
        <p>&nbsp;</p>
"""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.loadHTMLString(Constants.webContent, baseURL: nil)
    }
}

//
//  ViewController.swift
//  WKWebVIewSample
//
//  Created by anoop.
//  Copyright © 2017. All rights reserved.
//

import UIKit
import WebKit
class ViewController: UIViewController{
    
    @IBOutlet weak var webViewHolder:UIView!
    var wkWebView:WKWebView!
    var wkWebScriptHandler:WKWebScriptHandler!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpWKWebView()
        loadUrl()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // Set up the wkwebview and register delegates
    private func setUpWKWebView(){
        
        wkWebView = WKWebView(frame: webViewHolder.bounds)
        wkWebView.navigationDelegate = self
        wkWebView.uiDelegate = self
        webViewHolder.addSubview(wkWebView)
        
        // Move out all script handling logic from view controller
        wkWebScriptHandler = WKWebScriptHandler(handlerforWebView: wkWebView)
        wkWebScriptHandler.registerScriptsAndEvents()
        
        
    }
    // Load the html from local resource folder
    // MARK: Method to load html from resources
    private func loadUrl(){
        if let resourceUrl = Bundle.main.url(forResource: "start", withExtension: "html") {
            let urlRequest = URLRequest.init(url: resourceUrl)
            wkWebView.load(urlRequest)
        }
    }
    
    // Call js functions from native controls
    @IBAction func rightTapped(){
        
        evaluateWithJavaScriptExpression(jsExpression: "rightTapped();")
    }
    
    // Call js functions from native controls
    @IBAction func leftTapped(){
        evaluateWithJavaScriptExpression(jsExpression: "leftTapped();")
    }
    // MARK: JS CALLS
    fileprivate func evaluateWithJavaScriptExpression(jsExpression: String) {
        
        wkWebView.evaluateJavaScript(jsExpression, completionHandler: {(_, error) in
            if((error) != nil) {
                print(error?.localizedDescription ?? "")
            } else {
                
            }
        })
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

extension ViewController:WKNavigationDelegate, WKUIDelegate {
    
    // MARK: Webview Navigation Delegates
    public func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        
    }
    
    public func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Swift.Void) {
        
        switch navigationAction.navigationType {
        case .linkActivated:
            // Navigate to any internal links clicked
            wkWebView.load(navigationAction.request)
        case .reload:
            print("reloaded")
        default:
            break
        }
        decisionHandler(.allow)
    }
    // Handle alert
    public func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Swift.Void){
        
        let alertController = UIAlertController(title: message, message: nil,
                                                preferredStyle: .alert);
        
        alertController.addAction(UIAlertAction(title: "OK", style: .cancel) {
            _ in completionHandler()}
        );
        
        self.present(alertController, animated: true, completion: {});
    }
    
    
    
}


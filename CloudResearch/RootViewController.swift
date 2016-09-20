//
//  RootViewController.swift
//  CloudResearch
//
//  Created by 游辉 on 16/9/19.
//  Copyright © 2016年 游辉. All rights reserved.
//


import UIKit
import Foundation

//MARK: - 手势扩展
extension RootViewController:UIGestureRecognizerDelegate {
    
    //新建边缘手势
    func newGes() -> Void {
        let edgePanGestureRecognizer = UIScreenEdgePanGestureRecognizer.init(target: self, action: Selector(("edgePanGestureRecognizer:")))
        edgePanGestureRecognizer.delegate = self
        edgePanGestureRecognizer.edges = UIRectEdge.left
        self.view.addGestureRecognizer(edgePanGestureRecognizer)
    }
    
    
    //MARK: - 开始点击
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if self.navigationController != nil && self.navigationController!.viewControllers.count != 0 {
            return false
        }
        return true
    }
    
    //MARK: - 手势做的事情
    func edgePanGesture(edgePanGestureRecognizer:UIScreenEdgePanGestureRecognizer) -> Void {
        self.navigationController!.popViewController(animated: true)
    }

}

//MARK: - 导航栏定制
extension RootViewController {
    func setupNaviBar() {
        
        let ver = UIDevice.current.systemVersion.components(separatedBy: ".")
        
        if Int64(ver.first!)! >= 7 {
            self.navigationController?.navigationBar.barTintColor = UIColor.blue;
            self.navigationController?.navigationBar.tintColor = UIColor.white;
            self.navigationController?.navigationBar.isTranslucent = false;
        }
        else {
            // iOS 6.1 or earlier
            self.navigationController?.navigationBar.tintColor = UIColor.blue;
        }
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
        self.navigationItem.title = "Weex Playground"
        
        if (self.navigationItem.leftBarButtonItem != nil) {
            return
        }
        
        
        var leftItem:UIBarButtonItem?
        
        if (self.navigationController?.viewControllers.first?.isEqual(self))! {
            leftItem = backButtonItem()
        }
        else{
            leftItem = leftBarButtonItem()
            
        }
        
        self.navigationItem.leftBarButtonItems = [leftItem!];
        
    }
    
    func leftBarButtonItem() -> UIBarButtonItem {
        var leftItem = objc_getAssociatedObject(self, #function)
        if leftItem == nil {
            leftItem = UIBarButtonItem.init(image: UIImage.init(named: "scan"), style: UIBarButtonItemStyle.plain, target: self, action: Selector(("scanQR:")))
            //leftItem.accessibilityHint = "click to scan qr code"
            //leftItem.accessibilityValue = "scan qr code"
            objc_setAssociatedObject(self, #function, leftItem, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        return leftItem as! UIBarButtonItem
    }
    
    
    func backButtonItem() -> UIBarButtonItem {
        var backButtonItem = objc_getAssociatedObject(self, #function)
        if backButtonItem == nil {
            backButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "back"), style: UIBarButtonItemStyle.plain, target: self, action: Selector(("backButtonClicked:")))
            objc_setAssociatedObject(self, #function, backButtonItem, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        return backButtonItem as! UIBarButtonItem
    }
    
    
    func scanQR(sender:AnyObject) {
        //WXScannerVC * scanViewController = [[WXScannerVC alloc] init];
        //[self.navigationController pushViewController:scanViewController animated:YES];
    }
    
    func backButtonClicked(sender:AnyObject) -> Void {
        self.navigationController!.popViewController(animated: true)
    }
    

}


//MARK: - main
class RootViewController: UIViewController,SRWebSocketDelegate{//SRWebSocketDelegate

    
    var script:String?
    var url:URL?
    var hotReloadSocket:SRWebSocket?
    var source:String?
    var instance:WXSDKInstance?
    var refreshList:Array?
    var refreshList1:Array?
    var refresh:Array?
    var count:Int64?
    var weexHeight:Float64?
    var originalDelegate:UIScrollViewDelegate?

    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNaviBar()
        newGes()
        // Do any additional setup after loading the view.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - LoadSubViews
  
  
    
    //MARK: - Override
    
    //MARK: - Event
    
    //MARK: - Network
    
    //MARK: - Delegate
    //SRWebSocketDelegate
    func webSocket(_ webSocket: SRWebSocket!, didReceiveMessage message: Any!) {
        
    }
    
    //MARK: - Setter/Getter
    
    //MARK: - Private
    


    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

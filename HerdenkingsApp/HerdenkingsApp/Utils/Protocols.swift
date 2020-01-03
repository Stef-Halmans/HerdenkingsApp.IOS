//
//  Protocols.swift
//  HerdenkingsApp
//
//  Created by Stef Halmans on 11/18/19.
//  Copyright © 2019 Stef Halmans. All rights reserved.
//
import Foundation
import UIKit

@objc protocol ContainerButtonDelegate{
    
    var test: String { get }
    @objc func werkt()
}

protocol ContainerControllerDelegate{
    
    func changePage(page: pages)
    func HideDetailPage()
    
}

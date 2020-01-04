//
//  Variables.swift
//  HerdenkingsApp
//
//  Created by Stef Halmans on 11/20/19.
//  Copyright © 2019 Stef Halmans. All rights reserved.
//
public enum pages{
    case mainPage
    case kiesGebiedPage
    case lijstMonumentenPage
    case specifiekMonumentPage
    case geschiedenisPage
}

public enum gebieden : String, Codable {
   
    case roermond = "roermond"
    case herten = "herten"
    case swalmen = "swalmen"
    case maasniel = "maasniel"
    case asenray = "asenray"
    case alleGebieden = "alleGebieden"
}

public var currentGebied: gebieden!

public var previousPage: pages!
public var currentPage: pages!

public var showingSideMenu = false

public var monumenten: [Monument] = []

public var monumentNummer: Int = 0

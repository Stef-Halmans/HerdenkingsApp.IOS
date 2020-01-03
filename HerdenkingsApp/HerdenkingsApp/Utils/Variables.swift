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

public enum gebieden{
    case roermond
    case herten
    case swalmen
    case maasniel
    case asenray
    case alleGebieden
}

public var currentGebied: gebieden!

public var previousPage: pages!
public var currentPage: pages!

public var showingSideMenu = false

public var monumenten: [Monument] = []

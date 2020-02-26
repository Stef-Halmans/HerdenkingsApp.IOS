//
//  Functions.swift
//  HerdenkingsApp
//
//  Created by Stef Halmans on 1/23/20.
//  Copyright © 2020 Stef Halmans. All rights reserved.
//

import Foundation

public class Functions{
    public static func enumToString(gebied: gebieden) -> String{
        switch gebied{
        case .roermond:
            return "Roermond"
        case .herten:
            return "Herten"
        case .swalmen:
            return "Swalmen"
        case .maasniel:
            return "Maasniel"
        case .asenray:
            return "Asenray/Elmpterwald"
        case .alleGebieden:
            return "Alle gebieden"
        }
        
    }
}

//
//  JollyCooksApp.swift
//  JollyCooks
//
//  Created by Phillip Shen on 15/3/22.
//
/* Mvvm Notes
    Model - Data
    View - UI
    ViewModel - manages Models for View (Like puts/connects them together).
*/


import SwiftUI

@main
struct JollyCooksApp: App {
    var body: some Scene {
        WindowGroup {
            Main()
        }
    }
}
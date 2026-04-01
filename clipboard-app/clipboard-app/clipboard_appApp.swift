//
//  clipboard_appApp.swift
//  clipboard-app
//
//  Created by Neel Deshpande on 3/31/26.
//

import SwiftUI

@main
struct ClipboardApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        Settings { EmptyView() }
    }
}

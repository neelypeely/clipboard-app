//
//  AppDelegate.swift
//  clipboard-app
//
//  Created by Neel Deshpande on 3/31/26.
//


import Cocoa
import SwiftUI
import Carbon.HIToolbox

class AppDelegate: NSObject, NSApplicationDelegate {
    var statusItem: NSStatusItem?
    var popover: NSPopover?

    func applicationDidFinishLaunching(_ notification: Notification) {
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        
        if let button = statusItem?.button {
            button.title = "📋"
            button.action = #selector(togglePopover)
            button.target = self
        }
        
        let popover = NSPopover()
        popover.contentSize = NSSize(width: 320, height: 480)
        popover.behavior = .transient
        popover.contentViewController = NSHostingController(rootView: ContentView())
        self.popover = popover
        registerHotkey()
    }
    
    func registerHotkey() {
        let hotKeyID = EventHotKeyID(signature: OSType(0x434C4950), id: 1)
        var hotKeyRef: EventHotKeyRef?
        RegisterEventHotKey(UInt32(kVK_ANSI_V), UInt32(cmdKey | shiftKey), hotKeyID, GetApplicationEventTarget(), 0, &hotKeyRef)
        
        InstallEventHandler(GetApplicationEventTarget(), { _, event, _ -> OSStatus in
            let appDelegate = NSApplication.shared.delegate as? AppDelegate
            appDelegate?.togglePopover()
            return noErr
        }, 1, [EventTypeSpec(eventClass: OSType(kEventClassKeyboard), eventKind: UInt32(kEventHotKeyPressed))], nil, nil)
        
        
    }

    @objc func togglePopover() {
        if let button = statusItem?.button {
            if popover?.isShown == true {
                popover?.performClose(nil)
            } else {
                popover?.show(relativeTo: button.bounds, of: button, preferredEdge: .minY)
            }
        }
    }
}

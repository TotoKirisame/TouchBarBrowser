//
//  WindowController.swift
//  TouchBarBrowser
//
//  Created by 佐藤秀輔 on 2017/05/10.
//  Copyright © 2017年 佐藤秀輔. All rights reserved.
//

import Cocoa

fileprivate extension NSTouchBarCustomizationIdentifier {
    static let windowBar = NSTouchBarCustomizationIdentifier("com.TouchBarCatalog.windowTouchBar")
}

fileprivate extension NSTouchBarItemIdentifier {
    static let label = NSTouchBarItemIdentifier("com.TouchBarCatalog.TouchBarItem.label")
}

class WindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()
    
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
        self.window?.setFrameAutosaveName("WindowAutosave")
    }
    
    @available(OSX 10.12.2, *)
    override func makeTouchBar() -> NSTouchBar? {
        let touchBar = NSTouchBar()
        touchBar.delegate = self
        touchBar.customizationIdentifier = .windowBar
        touchBar.defaultItemIdentifiers = [.label, .fixedSpaceLarge, .otherItemsProxy]
        touchBar.customizationAllowedItemIdentifiers = [.label]
        
        return touchBar
    }

}

extension WindowController: NSTouchBarDelegate {
    
    @available(OSX 10.12.2, *)
    func touchBar(_ touchBar: NSTouchBar, makeItemForIdentifier identifier: NSTouchBarItemIdentifier) -> NSTouchBarItem? {
        
        switch identifier {
        case NSTouchBarItemIdentifier.label:
            let custom = NSCustomTouchBarItem(identifier: identifier)
            custom.customizationLabel = "TouchBar Catalog Label"
            
            let label = NSTextField.init(labelWithString: "Controll")
            custom.view = label
            
            return custom
            
        default:
            return nil
        }
    }
}

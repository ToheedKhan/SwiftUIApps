//
//  DevoteWidgetExtensionBundle.swift
//  DevoteWidgetExtension
//
//  Created by Toheed Jahan Khan on 05/02/24.
//

import WidgetKit
import SwiftUI

@main
struct DevoteWidgetExtensionBundle: WidgetBundle {
    var body: some Widget {
        DevoteWidgetExtension()
        DevoteWidgetExtensionLiveActivity()
    }
}

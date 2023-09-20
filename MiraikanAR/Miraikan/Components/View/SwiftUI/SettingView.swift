//
//  SettingView.swift
//  NavCogMiraikan
//
/*******************************************************************************
 * Copyright (c) 2023 © Miraikan - The National Museum of Emerging Science and Innovation
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *******************************************************************************/

import SwiftUI

struct SettingView: View {
    var body: some View {
        
        NavigationView {
            List {
                Section {
                    SliderView(min: 0.1,
                               max: 1,
                               defaultValue: 0.5,
                               step: 0.01,
                               format: "%.2f",
                               title: NSLocalizedString("Speech speed", comment: ""),
                               saveKey: "speech_speed")
                } header: {
                    Text(NSLocalizedString("Voice", comment: ""))
                }
                Section {
                    SwitchView(title: NSLocalizedString("AR Audio interrupt disabled", comment: ""),
                               saveKey: "ARAudioInterruptDisabled")
                    SwitchView(title: NSLocalizedString("AR Distance Limit Invalid", comment: ""),
                               saveKey: "ARDistanceLimit")
                    SwitchView(title: NSLocalizedString("AR Camera View", comment: ""),
                               saveKey: "ARCameraView")
                    SwitchView(title: NSLocalizedString("AR Camera Marker Anchor", comment: ""),
                               saveKey: "ARCameraMarkerAnchor")
                    SwitchView(title: NSLocalizedString("AR Camera Check Image", comment: ""),
                               saveKey: "ARCameraCheckImage")
                    SwitchView(title: NSLocalizedString("AR Camera Lock Marker", comment: ""),
                               saveKey: "ARCameraLockMarker")
                    SwitchView(title: NSLocalizedString("AR Marker Test Data", comment: ""),
                               saveKey: "ARMarkerTestData")
                    SliderView(min: 0,
                               max: 300,
                               defaultValue: MiraikanUtil.arReadingInterval,
                               step: 10,
                               format: "%.0f",
                               title: NSLocalizedString("AR reading interval", comment: ""),
                               saveKey: "ARReadingInterval")
                } header: {
                    Text(NSLocalizedString("Debug", comment: ""))
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle(NSLocalizedString("Settings", comment: ""), displayMode: .inline)
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}

//
//  SwitchView.swift
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

struct SwitchView: View {
    
    let title: String
    let saveKey: String
    @State private var flag = false

    init(title: String,
         saveKey: String) {

        self.title = title
        self.saveKey = saveKey

        _flag = State(initialValue: UserDefaults.standard.bool(forKey: saveKey))
    }

    var body: some View {
        Toggle(title, isOn: $flag)
            .padding(EdgeInsets(
                top: 4,
                leading: 0,
                bottom: 4,
                trailing: 0
            ))
            .onChange(of: flag,
                      perform: { newValue in
                UserDefaults.standard.set(newValue, forKey: saveKey)
            })
    }
}

struct SwitchView_Previews: PreviewProvider {
    static var previews: some View {
        SwitchView(title: "label", saveKey: "test")
    }
}

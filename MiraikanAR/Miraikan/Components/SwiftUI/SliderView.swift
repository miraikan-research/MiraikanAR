//
//  SliderView.swift
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

struct SliderView: View {

    let min: Double
    let max: Double
    let defaultValue: Double
    let step: Double
    let format: String
    let title: String
    let saveKey: String

    @State private var sliderVal: Double = 0
    @State var editing = false

    init(min: Double,
         max: Double,
         defaultValue: Double,
         step: Double,
         format: String,
         title: String,
         saveKey: String) {
    
        self.min = min
        self.max = max
        self.defaultValue = defaultValue
        self.step = step
        self.format = format
        self.title = title
        self.saveKey = saveKey

        _sliderVal = State(initialValue: self.defaultValue)
    }

    var body: some View {
        
        VStack {
                Text(title)
                    .font(.callout)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 0)
            
            HStack() {
                Text("\(sliderVal, specifier: format)")
                    .padding(.leading, 10)
                Slider (
                    value: $sliderVal,
                    in: min...max,
                    step: step,
                    label: { EmptyView() },
                    onEditingChanged: { editing in
                        self.editing = editing
                        if !editing {
                            UserDefaults.standard.set(sliderVal, forKey: saveKey)
                        }
                    }
                )
                .padding(EdgeInsets(
                    top: 0,
                    leading: 0,
                    bottom: 0,
                    trailing: 10
                ))
            }
        }
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(min: 0.1,
                   max: 1,
                   defaultValue: 0.5,
                   step: 0.01,
                   format: "%.2f",
                   title: "title",
                   saveKey: "test")
    }
}

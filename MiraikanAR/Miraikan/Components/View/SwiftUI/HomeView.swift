//
//  HomeView.swift
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

struct HomeView: View {
    
    var body: some View {
        
        NavigationView {
            List {
                Section {
                    NavigationLink(destination: toARViewController()
                        .navigationBarTitle(Text(NSLocalizedString("AR navigation", comment: "")),
                                            displayMode: .inline)
                            .navigationBarItems(
                                trailing:
                                    NavigationLink(destination: toIDListViewController()) {
                                        Text("List")
                                    }
                            )
                    ) {
                        Text(NSLocalizedString("AR navigation", comment: ""))
                    }
                } header: {
                    Text(NSLocalizedString("museum_info", comment: ""))
                }
                Section {
                    NavigationLink(destination: SettingView()) {
                        Text(NSLocalizedString("Settings", comment: ""))
                    }
                    NavigationLink(destination: AboutMiraikanView()) {
                        Text(NSLocalizedString("About Miraikan", comment: ""))
                    }
                    NavigationLink(destination: AboutAppView()) {
                        Text(NSLocalizedString("About This App", comment: ""))
                    }
                } header: {
                    Text(NSLocalizedString("app_info", comment: ""))
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle(NSLocalizedString("Home", comment: ""), displayMode: .inline)
        }
    }
}

struct toARViewController: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let vc = ARViewController()
        return vc
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    }
}

struct toIDListViewController: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let vc = IDListViewController()
        return vc
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

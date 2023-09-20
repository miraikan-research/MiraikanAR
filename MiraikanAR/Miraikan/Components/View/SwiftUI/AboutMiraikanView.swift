//
//  AboutMiraikanView.swift
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
import WebKit


struct AboutMiraikanView: View {

    @State private var isLoading = false
    @State private var isError = false

    var body: some View {
        ZStack(alignment: .center) {
            let address = "\(MiraikanUtil.miraikanHost)/aboutus/"
            WebView(loardUrl: URL(string: address), isLoading: $isLoading, isError: $isError)
            Text("web_loading")
                .multilineTextAlignment(.center)
                .opacity(isLoading ? 1 : 0)
            Text("web_failed")
                .multilineTextAlignment(.center)
                .opacity(isError ? 1 : 0)
        }
        .navigationBarTitleDisplayMode(.inline)
    }

    func reload() {
        self.isLoading = false
        self.isError = false
    }
}

struct AboutMiraikanView_Previews: PreviewProvider {
    static var previews: some View {
        AboutMiraikanView()
    }
}

struct WebView: UIViewRepresentable {
    
    let loardUrl: URL?
    @Binding var isLoading: Bool
    @Binding var isError: Bool

    private let webView = WKWebView()
    
    func makeUIView(context: UIViewRepresentableContext<WebView>) -> WKWebView {
        webView.navigationDelegate = context.coordinator
        if let loardUrl = self.loardUrl {
            let request = URLRequest(url: loardUrl)
            webView.load(request)
        }
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<WebView>) {
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
}

extension WebView {
    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebView

        init(_ parent: WebView) {
            self.parent = parent
        }

        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            self.parent.isLoading = true
            self.parent.isError = false
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            self.parent.isLoading = false
            self.parent.isError = false
        }

        func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError: Error) {
            self.parent.isLoading = false
            self.parent.isError = true
        }

        func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
            self.parent.isLoading = false
            self.parent.isError = true
        }
    }
}

//
//  ContentView.swift
//  testWebkit
//
//  Created by dr.Strange on 01/02/2024.
//

import SwiftUI
import WebKit

struct ContentView: View {
    
    
    var body: some View {
        VStack {
            container(url: openWeb())
        }
        .padding()
        
    }
    
    func container(url : URLRequest) -> WebView {
        WebView(req: url)
    }
    
    func openWeb() -> URLRequest {
        let url = URL(string: "https://mail.google.com")
        return URLRequest(url: url!)
    }
}

#Preview {
    ContentView()
}

struct WebView : UIViewRepresentable {
    let req: URLRequest
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.load(req)
    }
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        return webView
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebView
        
        init(_ parent: WebView) {
            self.parent = parent
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            
            Task {
                await step1(webView)
                await step2(webView)
            }
            
        }
        
        func  step1(_ webView: WKWebView) async {
            await webView.evaluateJavaScript( "document.getElementsByClassName('VfPpkd-Jh9lGc')[2].click();") { (result, error) in
//                print(result)
                if let error = error {
                    print("JavaScript Error: \(error.localizedDescription)")
                }
            }
        }
        
        func  step2(_ webView: WKWebView) async {
            await webView.evaluateJavaScript( "document.getElementsByClassName('VfPpkd-StrnGf-rymPhb-pZXsl')[0].click();") { (result, error) in
//                print(result)
                if let error = error {
                    print("JavaScript Error: \(error.localizedDescription)")
                }
            }
        }
    }
}

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
                await step2new(webView)
            }
            
        }
        
        func  step1(_ webView: WKWebView) async {
            await webView.evaluateJavaScript( "document.getElementsByClassName('VfPpkd-Jh9lGc')[2].click();") { (result, error) in
                if let error = error {
                    print("JavaScript Error: \(error.localizedDescription)")
                }
            }
        }
        
        func  step2(_ webView: WKWebView) async {
            await webView.evaluateJavaScript( "document.getElementsByClassName('VfPpkd-StrnGf-rymPhb-pZXsl')[0].click();") { (result, error) in
                if let error = error {
                    print("JavaScript Error: \(error.localizedDescription)")
                }
            }
        }
        
        func step2new(_ webView: WKWebView) async {
            await webView.evaluateJavaScript("document.getElementsByClassName('VfPpkd-StrnGf-rymPhb-pZXsl')[0].click();") { [weak self] (result, error) in
                if let error = error {
                    print("JavaScript Error: \(error.localizedDescription)")
                } else {
                    // Đợi và kiểm tra trạng thái sau đó gọi step3
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        Task {
                            await self?.step3(webView)
                            await self?.step4(webView)
                            await self?.step5(webView)
                            
                        }
                    }
                }
            }
        }
        
        func step3(_ webView: WKWebView) async {
            
            
            await webView.evaluateJavaScript( "javascript:document.getElementById('firstName').value='something';") { (result, error) in
                
                if let error = error {
                    print("JavaScript Error: \(error.localizedDescription)")
                }
            }
        }
        
        func step4(_ webView: WKWebView) async {
            
            
            await webView.evaluateJavaScript( "javascript:document.getElementById('lastName').value='something';") { (result, error) in
                
                if let error = error {
                    print("JavaScript Error: \(error.localizedDescription)")
                }
            }
        }
        func step5(_ webView: WKWebView) async {
            
            
            await webView.evaluateJavaScript( "javascript:document.getElementsByClassName('VfPpkd-Jh9lGc')[0].click();") { (result, error) in
                
                if let error = error {
                    print("JavaScript Error: \(error.localizedDescription)")
                }
            }
        }
    }
    
}

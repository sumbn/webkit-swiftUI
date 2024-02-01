//
//  ContentView.swift
//  testWebkit
//
//  Created by dr.Strange on 01/02/2024.
//

import SwiftUI
import WebKit

struct ContentView: View {
    
    var url : URLRequest {
        return URLRequest(url: URL(string: "https://mail.google.com")!)
    }
    
   
    
    var body: some View {
        VStack {
            container(url: url)
        }
        .padding()
        
    }
    
    func container(url : URLRequest) -> WebView {
        WebView(req: url)
    }
}

#Preview {
    ContentView()
}

struct WebView : UIViewRepresentable {
    let req: URLRequest
    
    var object: PersonDecode
    
    init(req: URLRequest){
        self.req = req
        if let url = urlData("data") {
            if let person : PersonDecode = readData(from: url) {
                self.object = person
                return
            }
        }
        
        self.object = PersonDecode()
    }
    
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
                try? await Task.sleep(nanoseconds: 6_000_000_000)
//                await step3(webView)
//                await step4(webView)
//                await step5(webView)
                await step6(webView)
                await step7(webView)
                await step8(webView)
                await step9(webView)
                try? await Task.sleep(nanoseconds: 2_000_000_000)
                await step10(webView)
                
                
            }
            
        }
        
        func  step1(_ webView: WKWebView) async {
            await webView.evaluateJavaScript( "document.getElementsByClassName('VfPpkd-Jh9lGc')[2].click();") { (result, error) in
                if let error = error {
                    print("JavaScript Error: step 1")
                }
            }
        }
        
        func  step2(_ webView: WKWebView) async {
            await webView.evaluateJavaScript( "document.getElementsByClassName('VfPpkd-StrnGf-rymPhb-pZXsl')[0].click();") { (result, error) in
                if let error = error {
                    print("JavaScript Error: step 2)")
                }
            }
        }
        
        func step2new(_ webView: WKWebView) async {
            await webView.evaluateJavaScript("document.getElementsByClassName('VfPpkd-StrnGf-rymPhb-pZXsl')[0].click();") { [weak self] (result, error) in
                if let error = error {
                    print("JavaScript Error: step 2 new")
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
            
            let firstName = (parent.object.name ?? "").formatString()
            await webView.evaluateJavaScript( "javascript:document.getElementById('firstName').value='\(firstName)';") { (result, error) in
               
                if let error = error {
                    print("JavaScript Error: step 3")
                }
            }
        }
        
        func step4(_ webView: WKWebView) async {
            
            let lastName = (parent.object.maidenName ?? "").formatString()
            
            await webView.evaluateJavaScript( "javascript:document.getElementById('lastName').value='\(lastName)';") { (result, error) in
                
                if let error = error {
                    print("JavaScript Error: step 4")
                }
            }
        }
        func step5(_ webView: WKWebView) async {
            
            await webView.evaluateJavaScript( "javascript:document.getElementsByClassName('VfPpkd-Jh9lGc')[0].click();") { (result, error) in
                
                if let error = error {
                    print("JavaScript Error: step 5")
                }
            }
        }
        
        func step6(_ webView: WKWebView) async {
            
            let birthday = parent.object.birthData ?? "01-01-2000"
            guard let date = dateFromString(birthday) else {
                return
            }
            let month = monthFromDate(date)
            await webView.evaluateJavaScript( "javascript:document.getElementById('month').value='4';") { (result, error) in
                
                if let error = error {
                    print("JavaScript Error: step 6")
                }
            }
        }
        
        func step7(_ webView: WKWebView) async {
            
            let birthday = parent.object.birthData ?? "01-01-2000"
            guard let date = dateFromString(birthday) else {
                return
            }
            let day = dayFromDate(date)
            await webView.evaluateJavaScript( "javascript:document.getElementById('day').value='22';") { (result, error) in
                
                if let error = error {
                    print("JavaScript Error: step 7")
                }
            }
        }
        
        func step8(_ webView: WKWebView) async {
            
            let birthday = parent.object.birthData ?? "01-01-2000"
            guard let date = dateFromString(birthday) else {
                return
            }
            let day = dayFromDate(date)
            await webView.evaluateJavaScript( "javascript:document.getElementById('year').value='1990';") { (result, error) in
                
                if let error = error {
                    print("JavaScript Error: step 8")
                }
            }
        }
        
        func step9(_ webView: WKWebView) async {
            
            let birthday = parent.object.birthData ?? "01-01-2000"
            guard let date = dateFromString(birthday) else {
                return
            }
            let day = dayFromDate(date)
            await webView.evaluateJavaScript( "javascript:document.getElementById('gender').value='2';") { (result, error) in
                
                if let error = error {
                    print("JavaScript Error: step 9")
                }
            }
        }
        func step10(_ webView: WKWebView) async {
            
            let birthday = parent.object.birthData ?? "01-01-2000"
            guard let date = dateFromString(birthday) else {
                return
            }
            let day = dayFromDate(date)
            await webView.evaluateJavaScript( "javascript:document.getElementsByClassName('VfPpkd-Jh9lGc')[0].click();") { (result, error) in
                
                if let error = error {
                    print("JavaScript Error: step 10")
                }
            }
        }
        
    }
        
}

extension String {
    func formatString() -> String {
        
        return self.replacingOccurrences(of: "'", with: ". ")
    }
}

//func checkValue(_ query: String) async {
//    await webView.evaluateJavaScript( "javascript:document.getElementById('month').value='\(day)';") { (result, error) in
//        
//        if let error = error {
//            print("JavaScript Error: step 6")
//        }
//    }
//})

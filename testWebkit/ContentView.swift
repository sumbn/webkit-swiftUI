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
                await step2(webView)
                try? await Task.sleep(nanoseconds: 2_000_000_000)
                await step3(webView)
                await step4(webView)
                await step5(webView)
                try? await Task.sleep(nanoseconds: 2_000_000_000)
                await step6(webView)
                await step7(webView)
                await step8(webView)
                await step9(webView)
                await step10(webView)
                await step11(webView)
                await step12(webView)
                await step13(webView)
            }
            
        }
        
        func  step1(_ webView: WKWebView) async {
//            let jv = "document.getElementsByClassName('VfPpkd-Jh9lGc')[2].click();"
            let jv = """
            setTimeout(function() { 
                document.getElementById('yDmH0d').click();
            }, 1000);
            """
            
            await webView.evaluateJavaScript(jv) { (result, error) in
                if error != nil {
                    print("JavaScript Error: step 1")
                }
            }
        }
        
        func step2(_ webView: WKWebView) async {
            let js = """
            setTimeout(function() {
                document.getElementsByClassName('VfPpkd-StrnGf-rymPhb-pZXsl')[0].click();
            }, 1000);
            """
            await webView.evaluateJavaScript(js) { (result, error) in
                // Xử lý kết quả hoặc lỗi
            }
        }
        
        func step3(_ webView: WKWebView) async {
            
            let firstName = (parent.object.name ?? "").formatString()
            
            let js = """
            setTimeout(function() {
                document.getElementById('firstName').value='\(firstName)';
            }, 1000);
            """
            await webView.evaluateJavaScript(js) { (result, error) in
               
                if error != nil {
                    print("JavaScript Error: step 3")
                }
            }
        }
        
        func step4(_ webView: WKWebView) async {
            let lastName = (parent.object.maidenName ?? "").formatString()
            
            let js = """
            setTimeout(function() {
                    document.getElementById('lastName').value='\(lastName)';
            }, 1000);
            """
            
            await webView.evaluateJavaScript(js) { (result, error) in
                
                if error != nil {
                    print("JavaScript Error: step 4")
                }
            }
        }
        func step5(_ webView: WKWebView) async {
//            let js2 = """
//            setTimeout(function() {
//                document.getElementsByClassName('VfPpkd-Jh9lGc')[0].click();
//            }, 1000);
//            """
            
            let js = """
            setTimeout(function() {
                document.getElementById('collectNameNext').click();
            }, 1000);
            """
            await webView.evaluateJavaScript(js) { (result, error) in
                if error != nil {
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
            let js = """
            setTimeout(function() {
                document.getElementById('month').value='\(month)';
            }, 1000);
            """
            await webView.evaluateJavaScript(js) { (result, error) in
                
                if error != nil {
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
            
            let js = """
            setTimeout(function() {
                    document.getElementById('day').value='\(day)';
            }, 1000);
            """
            
            await webView.evaluateJavaScript(js) { (result, error) in
                
                if error != nil {
                    print("JavaScript Error: step 7")
                }
            }
        }
        
        func step8(_ webView: WKWebView) async {
            
            let birthday = parent.object.birthData ?? "01-01-2000"
            guard let date = dateFromString(birthday) else {
                return
            }
            let year = yearFromDate(date)
            let js = """
            setTimeout(function() {
                document.getElementById('year').value='\(year)';
            }, 1000);
            """
            
            await webView.evaluateJavaScript(js) { (result, error) in
                
                if error != nil {
                    print("JavaScript Error: step 8")
                }
            }
        }
        
        func step9(_ webView: WKWebView) async {
            let js = """
            setTimeout(function() {
                document.getElementById('gender').value='2';
            }, 1000);
            """
            await webView.evaluateJavaScript(js) { (result, error) in
                
                if error != nil {
                    print("JavaScript Error: step 9")
                }
            }
        }
        
        func step10(_ webView: WKWebView) async {
            
//            let js2 = """
//            setTimeout(function() {
//                document.getElementsByClassName('VfPpkd-Jh9lGc')[0].click()}, 1000);
//            """
            let js = """
            setTimeout(function() {
                document.getElementById('birthdaygenderNext').click()}, 1000);
            """
            await webView.evaluateJavaScript(js) { (result, error) in
                if error != nil {
                    print("JavaScript Error: step 10")
                }
            }
        }
        
        func step11(_ webView: WKWebView) async {
            
            let js = """
                    var button = document.querySelector('#yDmH0d > c-wiz > div.aDGQwe > div.eKnrVb > div > div.j663ec > div > form > span > section > div > div > div.IhH7Wd.hdGwMb.V9RXW > div.ci67pc > div > span > div:nth-child(3) > div > div.enBDyd > div > div.SCWude > div');
                    button.click();
            """
            
            await webView.evaluateJavaScript(js){ (result, error) in
                
                if let error = error {
                    print("JavaScript Error: step 11")
                }
            }
        }
        
        func step12(_ webView: WKWebView) async {
            
            let js = """
                                setTimeout(function() { document.getElementsByClassName('whsOnd zHQkBf')[0].value = 'nguyenvanabc'; }, 2000);
            """
            
            await webView.evaluateJavaScript(js){ (result, error) in
                
                if let error = error {
                    print("JavaScript Error: step 11")
                }
            }
        }
        
        func step13(_ webView: WKWebView) async {
            
            let js = """
            setTimeout(function() {
                document.getElementById('next').click()}, 1000);
            """
            await webView.evaluateJavaScript(js) { (result, error) in
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


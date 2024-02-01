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
        let url = URL(string: "https://youtube.com")
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
        return WKWebView()
    }
}

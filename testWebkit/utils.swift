//
//  utils.swift
//  testWebkit
//
//  Created by dr.Strange on 02/02/2024.
//

import Foundation

var urlData : (String) -> URL? = { value in
    guard let fileURL = Bundle.main.url(forResource: value, withExtension: "json")
        else { fatalError("Failed to locate file in bundle.") }
    return fileURL
}


func readData<T: Decodable>(from url: URL?) -> T? {
    guard let url = url else { return nil }
    
    do {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        let decodedData = try decoder.decode(T.self, from: data)
        return decodedData
    } catch {
        // It's generally a bad idea to use fatalError in a library or utility function,
        // so here we're just printing the error and returning nil to handle the failure more gracefully.
        print("Error: \(error)")
        return nil
    }
}

func dateFromString(_ dateString: String) -> Date? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd" // Định dạng ngày tháng giống với chuỗi
    return dateFormatter.date(from: dateString)
}

func dayFromDate(_ date: Date) -> String {
    return String(Calendar.current.component(.day, from: date))
}

func monthFromDate(_ date: Date) -> String {
    return String(Calendar.current.component(.month, from: date))
}

func yearFromDate(_ date: Date) -> String {
    return String(Calendar.current.component(.year, from: date))
}

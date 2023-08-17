//
//  Crawling.swift
//  FindBook
//
//  Created by 황지웅 on 2023/08/17.
//

import Foundation
import SwiftSoup

func crawling() {
    guard let url = URL(string: "https://product.kyobobook.co.kr/detail/S000001707885") else {
        print("get url error")
        return
    }
    guard let html = try? String(contentsOf: url, encoding: String.Encoding(rawValue: CFStringConvertEncodingToNSStringEncoding(0x422))) else {
        print("get html error")
        return
    }
    guard let doc: Document = try? SwiftSoup.parse(html) else {
        print("get doc error")
        return
    }
    guard let elements: Elements = try? doc.select("#contents > div.prod_detail_header > div > div.prod_detail_view_wrap > div.prod_detail_view_area > div:nth-child(3) > div.btn_wrap.justify.overlap > button") else {
        print("get element error")
        return
    }
    guard let text = try? elements.text() else {
        print("get text error")
        return
    }
    print(text)
}

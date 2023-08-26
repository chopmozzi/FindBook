//
//  Crawling.swift
//  FindBook
//
//  Created by 황지웅 on 2023/08/17.
//

import Foundation
import SwiftSoup

func storeCrawling() {
    guard let url = URL(string: "https://www.kyobobook.co.kr/store?storeCode=001") else {
        print("get url error")
        return
    }
    do {
        let html = try String(contentsOf: url)
        let doc = try SwiftSoup.parse(html)
        let parsingData = try doc.select("#contents > div.store_detail_header > div > div.store_header_menu_wrap > div").select("div.sps_inner").select("div > div > div > div > div > div:nth-child(1)").select("div > div > div > div > ul").select("li > a")
        let storeLinks = try parsingData.map { try $0.attr("href") }
        let storeNames = try parsingData.map { try $0.text()}
        storeLinks.forEach {
            print($0)
        }
        storeNames.forEach {
            print($0)
        }
    } catch {
        print("get html error")
    }
}

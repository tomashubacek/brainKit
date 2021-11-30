//
//  PDFCreator.swift
//  BrainKit
//
//  Created by Ondřej Hanák on 04. 06. 2020.
//  Copyright © 2020 Userbrain. All rights reserved.
//

import UIKit
import WebKit

public final class PDFCreator: NSObject {
	private let webView = WKWebView()
	private var paperSize = CGSize.zero
	private var paperInsets = UIEdgeInsets.zero
	private var pdfURL: URL?
	private var callback: ((_ success: Bool)->Void)?

	// MARK: - Lifecycle

	@objc
	public init(with view: UIView) {
		super.init()
		self.webView.navigationDelegate = self
		self.webView.isUserInteractionEnabled = false
		self.webView.isHidden = true
		view.addSubview(self.webView)
	}

	deinit {
		self.webView.removeFromSuperview()
	}

	// MARK: - Public

	@objc
	public func render(htmlURL: URL, accessURL: URL, pdfURL: URL, paper: CGSize, insets: UIEdgeInsets, callback: @escaping ((_ success: Bool)->Void)) {
		self.pdfURL = pdfURL
		self.paperSize = paper
		self.paperInsets = insets
		self.callback = callback
		self.webView.loadFileURL(htmlURL, allowingReadAccessTo: accessURL)
	}

	// MARK: - Private

	private func renderPDF(formatter: UIViewPrintFormatter) -> Bool {
		guard let pdfURL = self.pdfURL else { return false }
		// Based on https://gist.github.com/nyg/b8cd742250826cb1471f
		let page = CGRect(x: 0, y: 0, width: self.paperSize.width, height: self.paperSize.height)
		let printable = page.inset(by: self.paperInsets)

		let render = UIPrintPageRenderer()
		render.addPrintFormatter(formatter, startingAtPageAt: 0)
		render.setValue(NSValue(cgRect: page), forKey: "paperRect")
		render.setValue(NSValue(cgRect: printable), forKey: "printableRect")

		let pdfData = NSMutableData()
		UIGraphicsBeginPDFContextToData(pdfData, CGRect.zero, nil)
		for i in 1...render.numberOfPages {
			UIGraphicsBeginPDFPage();
			let bounds = UIGraphicsGetPDFContextBounds()
			render.drawPage(at: i - 1, in: bounds)
		}
		UIGraphicsEndPDFContext()
		let result = pdfData.write(to: pdfURL, atomically: true)
		return result
	}
}

extension PDFCreator: WKNavigationDelegate {
	public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
		// Sometimes, this delegate is called before the image is loaded. Thus we give it a bit more time.
		DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
			let result = self.renderPDF(formatter: webView.viewPrintFormatter())
			self.callback?(result)
		}
	}

	public func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
		self.callback?(false)
	}
}

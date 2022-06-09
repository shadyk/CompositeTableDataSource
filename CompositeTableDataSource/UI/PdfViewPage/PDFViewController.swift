//
//  Created by Shady
//  All rights reserved.
//  

import PDFKit
import UIKit

class PDFViewController: UIViewController {
    private var pdfString: String = "" {
        didSet{
            loadPDF()
        }
    }
    private var pdfView: PDFView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNav()
        setupPDFView()
        loadPDF()
    }
    convenience init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?,pdf:String ) {
        self.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        defer { self.pdfString = pdf}
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupNav() {
        navigationController?.isNavigationBarHidden = false
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = true
    }

    private func setupPDFView() {
        pdfView = PDFView()
        view.addSubview(pdfView)
        pdfView.translatesAutoresizingMaskIntoConstraints = false
        pdfView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    private func loadPDF() {
        let asciiData = pdfString.data(using: .ascii)
        let fromStringToData = Data(base64Encoded: asciiData!, options: .ignoreUnknownCharacters)
        if let pdfDocument = PDFDocument(data: fromStringToData!) {
            pdfView.displayMode = .singlePageContinuous
            pdfView.autoScales = true
            pdfView.displayDirection = .vertical
            pdfView.document = pdfDocument
        }
    }
}

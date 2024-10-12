//
//  ReceiptScannerView.swift
//  TripTally
//
//  Created by Martin on 2024/10/12.
//

import SwiftUI
import VisionKit

struct ReceiptScannerView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> VNDocumentCameraViewController {
        let scannerViewController = VNDocumentCameraViewController()
        scannerViewController.delegate = context.coordinator
        return scannerViewController
    }
    
    func updateUIViewController(_ uiViewController: VNDocumentCameraViewController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, VNDocumentCameraViewControllerDelegate {
        var parent: ReceiptScannerView
        
        init(_ parent: ReceiptScannerView) {
            self.parent = parent
        }
        
        func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
            controller.dismiss(animated: true)
        }
    }
}

#Preview {
    ReceiptScannerView()
}

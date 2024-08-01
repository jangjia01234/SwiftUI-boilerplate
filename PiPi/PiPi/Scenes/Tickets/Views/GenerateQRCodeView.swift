//
//  GenerateQRCodeView.swift
//  PiPi
//
//  Created by Jia Jang on 8/1/24.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

struct GenerateQRCodeView: View {
    @State var inputText: String = "pipi://"
    
    var body: some View {
        generateQRCode(text: inputText)
            .interpolation(.none)
            .resizable()
            .scaledToFit()
    }
    
    private func generateQRCode(text: String) -> Image {
        let ciContext = CIContext()
        
        guard let data = text.data(using: .ascii, allowLossyConversion: false) else {
            return Image(systemName: "exclamationmark.octagon")
        }
        
        let filter = CIFilter.qrCodeGenerator()
        filter.message = data
        
        if let ciImage = filter.outputImage {
            if let cgImage = ciContext.createCGImage(
                ciImage,
                from: ciImage.extent) {
                return Image(uiImage: UIImage(cgImage: cgImage))
            }
        }
        
        return Image(systemName: "exclamationmark.octagon")
    }
}

#Preview {
    GenerateQRCodeView()
}

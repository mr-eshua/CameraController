//
//  CameraPreview.swift
//  CameraController
//
//  Created by Itay Brenner on 7/21/20.
//  Copyright © 2020 Itaysoft. All rights reserved.
//

import SwiftUI
import AVFoundation

struct CameraPreview: NSViewRepresentable {
    @Binding var captureDevice: AVCaptureDevice?

    func makeNSView(context: Context) -> CameraPreviewInternal {
        return CameraPreviewInternal(frame: .zero, device: captureDevice)
    }

    func updateNSView(_ nsView: CameraPreviewInternal, context: NSViewRepresentableContext<CameraPreview>) {
        nsView.updateCamera(captureDevice)
    }

    static func dismantleNSView(_ nsView: CameraPreviewInternal, coordinator: ()) {
        nsView.stopRunning()
    }
}

//
//  CameraManage.swift
//  PDSCamera
//
//  Created by Lightning on 15/8/11.
//  Copyright (c) 2015年 Lightning. All rights reserved.
//

import UIKit
import AVFoundation

protocol CameraManageDelegate {
    func cameraOutput(sampleBuffer:CMSampleBufferRef,captureConnection:AVCaptureConnection)
    
}


@objc
public class CameraManage : NSObject,AVCaptureVideoDataOutputSampleBufferDelegate,AVCaptureAudioDataOutputSampleBufferDelegate {
    
    public var captureSession : AVCaptureSession
    var videoDeviceInput : AVCaptureDeviceInput?
    var audioDeviceInput : AVCaptureDeviceInput?
    var videoQueue : dispatch_queue_t
    
    var delegate:CameraManageDelegate?
    
    public var flashEnable : Bool {
        get { return self.flashEnable}
        set {
            if newValue == flashEnable{
                return
            } else {
                self.flashEnable = newValue
                let videoDevice = videoDeviceInput!.device
                videoDevice.lockForConfiguration(nil)
                if self.flashEnable {
                    videoDevice.flashMode = .On
                } else {
                    videoDevice.flashMode = .Off
                }
            }
            
        }
    }
    override init() {

        captureSession = AVCaptureSession()
        videoQueue = dispatch_queue_create("video queue", DISPATCH_QUEUE_SERIAL)
        super.init()

        setupCaptureSession()
    }

    
    public func setupCaptureSession(){
//        captureSession = AVCaptureSession()
        if captureSession.canSetSessionPreset(AVCaptureSessionPreset1280x720)
        {
            captureSession.sessionPreset = AVCaptureSessionPreset1280x720
        }
        
        // add videoDeviceInput to session
        var videoDevice : AVCaptureDevice = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
        videoDeviceInput = AVCaptureDeviceInput.deviceInputWithDevice(videoDevice, error: nil) as? AVCaptureDeviceInput
        if (captureSession.canAddInput(videoDeviceInput))
        {
            captureSession.addInput(videoDeviceInput)
        } else
        {
            print("session failed add video device input")
        }
        
        var videoOutput = AVCaptureVideoDataOutput()
        videoOutput.setSampleBufferDelegate(self, queue: videoQueue)
        if captureSession.canAddOutput(videoOutput)
        {
            captureSession.addOutput(videoOutput)
        } else {
            print("session failed add video output")
        }
        
        // audio
        var audioDevice : AVCaptureDevice = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeAudio)
        audioDeviceInput = AVCaptureDeviceInput.deviceInputWithDevice(audioDevice, error: nil) as? AVCaptureDeviceInput
        if captureSession.canAddInput(audioDeviceInput)
        {
            captureSession.addInput(audioDeviceInput)
        } else {
            print("session failed add audio input")
        }
        
        var audioOutput = AVCaptureAudioDataOutput()
        audioOutput.setSampleBufferDelegate(self, queue: videoQueue)
        if captureSession.canAddOutput(audioOutput)
        {
            captureSession.addOutput(audioOutput)
        } else {
            print("session failed add audio output")
        }
        
        
    }
    //MRAK : Camera Function
    public func switchCamera() {
        var videoDevice = videoDeviceInput!.device
        let currentPosition = videoDevice.position
        var preferPosition : AVCaptureDevicePosition
        switch (currentPosition){
        case .Front :
            preferPosition = .Back
        case .Back :
            preferPosition = .Front
        case .Unspecified :
            preferPosition = .Back
        default:
            preferPosition = .Back
        }
        let devices = AVCaptureDevice.devicesWithMediaType(AVMediaTypeVideo)
        for device in devices {
            let one = device as! AVCaptureDevice
            if one.position == preferPosition
            {
                videoDevice = one
                break
            }
        }
        
        //configrating
        let newDeviceInput = AVCaptureDeviceInput.deviceInputWithDevice(videoDevice, error: nil) as! AVCaptureDeviceInput
        captureSession.beginConfiguration()
        captureSession.removeInput(videoDeviceInput)
        if captureSession.canAddInput(newDeviceInput)
        {
            captureSession.addInput(newDeviceInput)
        }
        captureSession.commitConfiguration()
    }
    
// MARK: Delegate
    public func captureOutput(captureOutput: AVCaptureOutput!, didOutputSampleBuffer sampleBuffer: CMSampleBuffer!, fromConnection connection: AVCaptureConnection!) {
        if let valid = delegate {
            valid.cameraOutput(sampleBuffer, captureConnection: connection)
        }
    }
    
}

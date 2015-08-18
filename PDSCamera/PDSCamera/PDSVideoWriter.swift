//
//  PDSVideoWriter.swift
//  PDSCamera
//
//  Created by Lightning on 15/8/17.
//  Copyright (c) 2015年 Lightning. All rights reserved.
//

import UIKit
import AVFoundation

public class PDSVideoWriter {
    private var writer : AVAssetWriter?
    private var videoWriterInput : AVAssetWriterInput?
    var inputSetting : Dictionary? = [String : AnyObject]()
    var fileUrl : NSURL?
    
    var isRecording:Bool
    init(){
        
    }
    init(videoInputSetting : [String : AnyObject]?,_fileUrl:NSURL){
        isRecording = false
        inputSetting = videoInputSetting
        fileUrl = _fileUrl
    }
    
//    convenience init (setting:[String:String]){
//        self.init()
//        inputSetting = setting
//        writer = AVAssetWriter()
//        var writerInput = AVAssetWriterInput(mediaType: AVMediaTypeVideo, outputSettings: inputSetting)
//        
//    }
    
    public func startRecording(){
        isRecording = true
        if fileUrl == nil {
            print("fileUrl can't be nil")
            return
        }
        var error : NSErrorPointer
        writer = AVAssetWriter(URL: fileUrl, fileType: AVFileTypeMPEG4, error: error)
        
        if (inputSetting != nil)
        {
            videoWriterInput = AVAssetWriterInput(mediaType: AVMediaTypeVideo, outputSettings: inputSetting)
        }
        if let input = videoWriterInput {
            if writer!.canAddInput(input){
                writer!.addInput(input)
            }
        }
        

        
    }
    
    public func stopRecording(){
        
    }
    
    public func cancelRecording(){
        
    }
    
    public func startRecordingInOrientation(orientationTransform:CGAffineTransform){
        
    }
    
    public func processBuffer(pixelBuffer:CVPixelBufferRef?,bufferTime:CMTime?,SampleBuffer:CMSampleBufferRef?){
        if !isRecording
        {
            return
        }
        if (pixelBuffer == nil) && (SampleBuffer == nil)
        {
            print("two buffer can't be nil at the same time")
            return
        }
        
        if let buffer = pixelBuffer{
            
        }else if let sample = SampleBuffer {
            
        }
        
    }
}

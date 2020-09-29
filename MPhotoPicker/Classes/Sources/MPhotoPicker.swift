//
//  MPhotoPicker.swift
//  MPhotoPicker
//
//  Created by Van Trieu Phu Huy on 9/29/20.
//

import UIKit
import Photos

public class MPhotoPicker: NSObject {
    
    public static let shared: MPhotoPicker = {
        let instance = MPhotoPicker()
        return instance
    }()
    
    func loadConfig() {
        
        ZLPhotoConfiguration.default().themeColorDeploy.previewBgColor = UIColor.black.withAlphaComponent(0.1)
        ZLPhotoConfiguration.default().themeColorDeploy.previewBtnBgColor = UIColor.white
        ZLPhotoConfiguration.default().themeColorDeploy.previewBtnTitleColor = UIColor.black
        ZLPhotoConfiguration.default().themeColorDeploy.previewBtnHighlightTitleColor = zlRGB(80, 169, 56)
        ZLPhotoConfiguration.default().themeColorDeploy.navBarColor = UIColor.white//zlRGB(160, 160, 160).withAlphaComponent(0.65)
        ZLPhotoConfiguration.default().themeColorDeploy.navTitleColor = UIColor.white
        ZLPhotoConfiguration.default().themeColorDeploy.navEmbedTitleViewBgColor = zlRGB(80, 80, 80)
        ZLPhotoConfiguration.default().themeColorDeploy.albumListBgColor = zlRGB(45, 45, 45)
        ZLPhotoConfiguration.default().themeColorDeploy.albumListTitleColor = UIColor.white
        ZLPhotoConfiguration.default().themeColorDeploy.albumListCountColor = zlRGB(180, 180, 180)
        ZLPhotoConfiguration.default().themeColorDeploy.separatorColor = zlRGB(60, 60, 60)
        ZLPhotoConfiguration.default().themeColorDeploy.thumbnailBgColor = UIColor.white//zlRGB(50, 50, 50)
        ZLPhotoConfiguration.default().themeColorDeploy.bottomToolViewBgColor = zlRGB(35, 35, 35).withAlphaComponent(0.3)
        ZLPhotoConfiguration.default().themeColorDeploy.bottomToolViewBtnNormalTitleColor = UIColor.white
        ZLPhotoConfiguration.default().themeColorDeploy.bottomToolViewBtnDisableTitleColor = zlRGB(168, 168, 168)
        ZLPhotoConfiguration.default().themeColorDeploy.bottomToolViewBtnNormalBgColor = zlRGB(80, 169, 56)
        ZLPhotoConfiguration.default().themeColorDeploy.bottomToolViewBtnDisableBgColor = zlRGB(50, 50, 50)
        ZLPhotoConfiguration.default().themeColorDeploy.cameraRecodeProgressColor = zlRGB(80, 169, 56)
        ZLPhotoConfiguration.default().themeColorDeploy.selectedMaskColor = UIColor.black.withAlphaComponent(0.2)
        ZLPhotoConfiguration.default().themeColorDeploy.selectedBorderColor = zlRGB(80, 169, 56)
        ZLPhotoConfiguration.default().themeColorDeploy.invalidMaskColor = UIColor.white.withAlphaComponent(0.5)
        ZLPhotoConfiguration.default().themeColorDeploy.indexLabelBgColor = zlRGB(80, 169, 56)
        ZLPhotoConfiguration.default().themeColorDeploy.cameraCellBgColor = UIColor(white: 0.3, alpha: 1)
        
        ZLPhotoConfiguration.default().maxSelectCount = 100
        ZLPhotoConfiguration.default().maxRecordDuration = 60
        ZLPhotoConfiguration.default().maxSelectVideoDuration = 3600
        ZLPhotoConfiguration.default().allowTakePhotoInLibrary = false
        ZLPhotoConfiguration.default().allowPreviewSelectedPhotos = false
        ZLPhotoConfiguration.default().allowPreviewPhotos = false
        ZLPhotoConfiguration.default().allowPreviewSelectedPhotos = false
        ZLPhotoConfiguration.default().allowEditVideo = false
        ZLPhotoConfiguration.default().allowEditImage = false
        ZLPhotoConfiguration.default().allowSelectOriginal = true
        ZLPhotoConfiguration.default().editImageClipRatios = [.custom, .wh1x1, .wh3x4, .wh16x9, ZLImageClipRatio(title: "2 : 1", whRatio: 2 / 1)]
        
        ZLPhotoConfiguration.default().languageType = ZLLanguageType.vietnamese
    }
    
    public func present(in viewController: UIViewController, selectedColor: UIColor? = nil, maxSelectCount: Int? = nil, isOnlySelectPhoto: Bool? = nil, completion: @escaping ([PHAsset]) -> Void) {
        
        self.loadConfig()
        if let selectedColor = selectedColor {
            ZLPhotoConfiguration.default().themeColorDeploy.indexLabelBgColor = selectedColor
            ZLPhotoConfiguration.default().themeColorDeploy.bottomToolViewBtnNormalBgColor = selectedColor
        }
        if let maxSelectCount = maxSelectCount {
            ZLPhotoConfiguration.default().maxSelectCount = maxSelectCount
            ZLPhotoConfiguration.default().allowMixSelect = true
            ZLPhotoConfiguration.default().showSelectBtnWhenSingleSelect = true
        }
        if let isOnlySelectPhoto = isOnlySelectPhoto, isOnlySelectPhoto == true {
            ZLPhotoConfiguration.default().allowSelectVideo = false
            ZLPhotoConfiguration.default().allowSelectGif = false
            ZLPhotoConfiguration.default().allowSelectLivePhoto = false
        } else {
            ZLPhotoConfiguration.default().allowSelectImage = true
            ZLPhotoConfiguration.default().allowSelectVideo = true
            ZLPhotoConfiguration.default().allowSelectVideo = true
            ZLPhotoConfiguration.default().allowSelectGif = true
            ZLPhotoConfiguration.default().allowSelectLivePhoto = true
        }
        
        let ac = ZLPhotoPreviewSheet(selectedAssets:[])
        ac.selectImageBlock = { (images, assets, isOriginal) in
            completion(assets)
        }
        ac.showPhotoLibrary(sender: viewController)
    }

}

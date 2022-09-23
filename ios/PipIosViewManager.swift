import Foundation

@objc(PipIosViewManager)
class PipIosViewManager: RCTViewManager {
  override func view() -> (PipIosView) {
    return PipIosView()
  }
    override public class func requiresMainQueueSetup() -> Bool {
        return true;
    }
    // MARK: Exposed Obj-C bridging functions
      @objc func toggle(_ node: NSNumber) {
          print("toggle")
          DispatchQueue.main.async {
              let component = self.bridge.uiManager.view(forReactTag: node) as! PipIosView
              component.toggle()
          }
      }
      
  
}

class PipIosView : UIPiPView {

  @objc var color: String = "" {
    didSet {
      self.backgroundColor = hexStringToUIColor(hexColor: color)
    }
  }
    func toggle(){
        print("toggle")
        if (!self.isPictureInPictureActive()) {
            self.startPictureInPicture(withRefreshInterval: (0.1 / 60.0))
        } else {
            self.stopPictureInPicture()
        }
    }

  func hexStringToUIColor(hexColor: String) -> UIColor {
    let stringScanner = Scanner(string: hexColor)

    if(hexColor.hasPrefix("#")) {
      stringScanner.scanLocation = 1
    }
    var color: UInt32 = 0
    stringScanner.scanHexInt32(&color)

    let r = CGFloat(Int(color >> 16) & 0x000000FF)
    let g = CGFloat(Int(color >> 8) & 0x000000FF)
    let b = CGFloat(Int(color) & 0x000000FF)

    return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1)
  }
}

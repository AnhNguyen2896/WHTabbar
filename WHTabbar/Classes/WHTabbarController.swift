import UIKit

open class WHTabbarController: UITabBarController {
        
  
    // Screen width.
    public var myScreenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }

    // Screen height.
    public var myScreenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    
    public var centerButtonBottomMargin : CGFloat = 20.0
    public var centerButtonSize : CGFloat = 0.0
    public var centerButtonBackroundColor : UIColor =  #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    public var centerButtonBorderColor : UIColor =  #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
    public var centerButtonBorderWidth : CGFloat = 3
    public var centerButtonImage : UIImage?
    public var centerButtonImageSize :  CGFloat = 25.0
    
    var blockView : UIView?
    var centreButtonContainer : UIView?

    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
    
                
    }
    
    @objc func centerButtonAction(sender: UIButton) {
        
    }
    
    open override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
    }
    open override func tabBar(_ tabBar: UITabBar, willBeginCustomizing items: [UITabBarItem]) {
   
    }
    
    
    
  public func setupCenetrButton()  {
                
        
        if blockView != nil {
            blockView?.removeFromSuperview()
        }
        if centreButtonContainer != nil {
            centreButtonContainer?.removeFromSuperview()
        }
        
       
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            self.tabBar.items?[2].title = ""
        }
        
        let centreButtonContainer = UIView(frame: CGRect(x: 0, y: 0, width: centerButtonSize , height: centerButtonSize))
        centreButtonContainer.layer.cornerRadius = centerButtonSize / 2
        
        
        if UIDevice().userInterfaceIdiom == .phone {
                                
            
            
            
            
            
            centreButtonContainer.frame.origin.y = self.view.bounds.height - centerButtonBottomMargin

            centreButtonContainer.frame.origin.x = self.view.bounds.width/2 - centreButtonContainer.frame.width/2
        
        }
    
        
        centreButtonContainer.backgroundColor = centerButtonBackroundColor
        centreButtonContainer.layer.borderColor = centerButtonBorderColor.cgColor
        centreButtonContainer.layer.borderWidth = centerButtonBorderWidth
    
        
        let blockView = UIView(frame: CGRect(x: centreButtonContainer.center.x , y: centreButtonContainer.frame.minY, width: centerButtonSize + 20 , height: self.tabBar.frame.height))
      

        let centerButton = UIButton(frame: centreButtonContainer.frame)
        let centerButtonImageView = UIImageView(frame: CGRect(x: 0 , y: 0, width: centerButtonImageSize, height: centerButtonImageSize))
      
        centerButtonImageView.center = CGPoint(x: centreButtonContainer.frame.size.width  / 2,
                                           y: centreButtonContainer.frame.size.height / 2)
     
        centerButtonImageView.image = centerButtonImage
                
        centerButton.addTarget(self, action: #selector(centerButtonAction(sender:)), for: .touchUpInside)
        
        
        blockView.backgroundColor = UIColor.clear
        blockView.center.x = centreButtonContainer.center.x
        
        
        
        self.view.addSubview(blockView)
        self.view.addSubview(centreButtonContainer)
        
        centreButtonContainer.addSubview(centerButtonImageView)
        centreButtonContainer.addSubview(centerButton)
        
        
        
    }
    
   
    
    
}

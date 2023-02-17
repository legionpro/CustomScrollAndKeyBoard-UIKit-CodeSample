
import UIKit


final class ScrollViewKeyBoard: UIScrollView
{
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup()
    {
        NotificationCenter.default.addObserver(self,selector: #selector(keyboardDidShow(_:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
    }
    
    @objc private func keyboardDidShow(_ notification: Notification)
    {
        guard let userInfo = notification.userInfo, let frame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        let keyboardSize = frame.cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)
        resetContentInsets(contentInsets)

    }
    
    @objc private func keyboardWillHide(_ notification: Notification)
    {
        resetContentInsets(.zero)
    }
    
    private func resetContentInsets(_ contentInsets: UIEdgeInsets)
    {
        contentInset = contentInsets
        scrollIndicatorInsets = contentInsets
    }

}

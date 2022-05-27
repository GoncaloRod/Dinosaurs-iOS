import SpriteKit

protocol Updatable: AnyObject {
    
    func update(currentTime: TimeInterval)
    
}

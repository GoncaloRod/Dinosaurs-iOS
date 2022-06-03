import SpriteKit

protocol Updatable: AnyObject {
    
    func update(deltaTime: TimeInterval)
    
}

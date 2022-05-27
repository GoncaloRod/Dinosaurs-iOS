import SpriteKit
import GameKit

class GameScene : SKScene {
    
    let dinosaur = Dinosaur()
    
    override func didMove(to view: SKView) {
        
        backgroundColor = .white
        
        addChild(dinosaur)
        
    }
    
}

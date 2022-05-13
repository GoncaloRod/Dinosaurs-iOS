import SpriteKit
import GameKit

class GameScene : SKScene {
    
    override func didMove(to view: SKView) {
        
        backgroundColor = .white
        
        let label = SKLabelNode(text: "Game Scene")
        label.position = CGPoint(x: frame.midX, y: frame.midY)
        label.fontColor = .black
        
        addChild(label)
        
    }
    
}

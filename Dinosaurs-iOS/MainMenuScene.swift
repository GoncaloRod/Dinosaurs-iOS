import SpriteKit
import GameKit

class MainMenuScene : SKScene {
    
    override func didMove(to view: SKView) {
        
        backgroundColor = .white
        
        let label = SKLabelNode(text: "Main Menu")
        label.position = CGPoint(x: frame.midX, y: frame.midY)
        label.fontColor = .black
        
        addChild(label)
        
    }
    
}

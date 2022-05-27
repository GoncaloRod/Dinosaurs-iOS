import SpriteKit
import GameKit

class GameScene : SKScene {
    
    let dinosaur = Dinosaur()
    
    var updatables: [Updatable] = []
    
    override func didMove(to view: SKView) {
        
        backgroundColor = .white
        
        dinosaur.position = CGPoint(x: frame.width * 0.15, y: frame.height * 0.3)
        
        addChild(dinosaur)
        
        updatables.append(dinosaur)
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        for item in updatables {
            item.update(currentTime: currentTime)
        }
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        dinosaur.jump()
        
    }
    
}

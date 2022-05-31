import SpriteKit
import GameKit

class GameScene : SKScene {
    
    let dinosaur = Dinosaur()
    let cactus = Cactus()
    
    var updatables : [Updatable] = []
    
    override func didMove(to view: SKView) {
        
        backgroundColor = .white
        
        dinosaur.position = CGPoint(x: frame.width * 0.15, y: frame.height * 0.15)
        cactus.position = Cactus.randomPosition(frame.width, frame.height)
        
        dinosaur.startingPosY = frame.height * 0.15
        
        cactus.frameWidth = frame.width
        cactus.frameHeight = frame.height
        
        addChild(dinosaur)
        addChild(cactus)
        
        updatables.append(dinosaur)
        updatables.append(cactus)
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

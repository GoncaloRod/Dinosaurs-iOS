import SpriteKit
import GameKit

class GameScene : SKScene, SKPhysicsContactDelegate {
    
    let dinosaur = Dinosaur()
    let cactus = Cactus()
    
    let scoreLabel = SKLabelNode()
    
    var updatables : [Updatable] = []
    
    var score : CGFloat = 0
    
    var lastTime : TimeInterval = 0
    
    override func didMove(to view: SKView) {
        
        backgroundColor = .white
        
        dinosaur.position = CGPoint(x: frame.width * 0.15, y: frame.height * 0.15)
        cactus.position = Cactus.randomPosition(frame.width, frame.height)
        
        dinosaur.startingPosY = frame.height * 0.15
        
        cactus.frameWidth = frame.width
        cactus.frameHeight = frame.height
        
        physicsWorld.gravity = .zero
        physicsWorld.contactDelegate = self
        
        scoreLabel.fontColor = .black
        scoreLabel.position = CGPoint(x: frame.width * 0.5, y: frame.height * 0.9)
        scoreLabel.fontSize = 15
        
        addChild(dinosaur)
        addChild(cactus)
        
        addChild(scoreLabel)
        
        updatables.append(dinosaur)
        updatables.append(cactus)
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        if lastTime == 0 {
            lastTime = currentTime
        }
        
        let deltaTime = currentTime - lastTime
        
        for item in updatables {
            item.update(deltaTime: deltaTime)
        }
        
        if !dinosaur.isDead {
            score += CGFloat(deltaTime * 10)
        }
        
        updateScoreLabel()
        
        lastTime = currentTime
    }
    
    func updateScoreLabel() {
        scoreLabel.text = "SCORE: \(Int(score))"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if dinosaur.isDead {
            dinosaur.revive()
            cactus.restart()
            score = 0
        }
        else {
            dinosaur.jump()
        }
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        var first : SKPhysicsBody
        var second : SKPhysicsBody
        
        if (contact.bodyA.categoryBitMask > contact.bodyB.categoryBitMask) {
            first = contact.bodyA
            second = contact.bodyB
        } else {
            first = contact.bodyB
            second = contact.bodyA
        }
        
        if (first.contactTestBitMask == PhysicsCategories.Dinosaur && second.contactTestBitMask == PhysicsCategories.Cactus) {
            dinosaur.kill()
            cactus.stop()
        }
    }
    
}

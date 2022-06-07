import SpriteKit
import GameKit

class Dinosaur : SKNode, Updatable {
    
    let scale : CGFloat = 0.05
    
    var atlas : SKTextureAtlas
    
    var animation : SKAction
    var dinoRunFrames : [SKTexture] = []
    
    var dinoDeadFrame : SKTexture
    
    var sprite : SKSpriteNode
    
    var verticalSpeed : CGFloat = 0
    
    var grounded : Bool = true
    
    var startingPosY : CGFloat = 0
    
    var isDead : Bool = false
    
    override init() {
        atlas = SKTextureAtlas(named: "Dinosaurs")
        
        dinoRunFrames.removeAll()
        
        dinoRunFrames.append(atlas.textureNamed("Dino_Run_1"))
        dinoRunFrames.append(atlas.textureNamed("Dino_Run_2"))
        
        dinoDeadFrame = atlas.textureNamed("Dino_Dead")
        
        sprite = SKSpriteNode(texture: dinoRunFrames[0])
        
        sprite.anchorPoint = CGPoint(x: 0.5, y: 0)
        
        sprite.xScale = scale
        sprite.yScale = scale
        
        animation = SKAction.animate(with: dinoRunFrames, timePerFrame: 0.1)
        sprite.run(SKAction.repeatForever(animation))
        
        super.init()
        
        physicsBody = SKPhysicsBody(rectangleOf: sprite.size)
        
        physicsBody?.isDynamic = true
        physicsBody?.usesPreciseCollisionDetection = true
        
        physicsBody?.categoryBitMask = PhysicsCategories.Dinosaur
        physicsBody?.contactTestBitMask = PhysicsCategories.Cactus
        physicsBody?.collisionBitMask = PhysicsCategories.None
        
        addChild(sprite)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(deltaTime: TimeInterval) {
        
        if isDead {
            return
        }
        
        position.y += verticalSpeed * CGFloat(deltaTime) * 40
        
        if position.y <= startingPosY {
            grounded = true
            position.y = startingPosY
        }
        else {
            grounded = false
        }
        
        if !grounded {
            verticalSpeed -= CGFloat(deltaTime) * 40
        }
        
    }
    
    func jump() {
        
        if isDead || !grounded {
            return
        }
        
        verticalSpeed = 12
        
    }
    
    func kill() {
        
        sprite.removeAllActions()
        sprite.texture = dinoDeadFrame
        
        isDead = true
        
    }
    
    func revive () {
        position.y = startingPosY
        
        sprite.run(SKAction.repeatForever(animation))
        
        isDead = false
    }
    
}

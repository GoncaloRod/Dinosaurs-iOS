import SpriteKit
import GameKit

class Cactus : SKNode, Updatable {
    
    let startSpeed : CGFloat = 1
    let speedIncrement : CGFloat = 0.02
        
    let scale : CGFloat = 0.05
    
    var frameWidth : CGFloat = 0
    var frameHeight : CGFloat = 0
    
    var atlas : SKTextureAtlas
    var texture : SKTexture
    
    var sprite : SKSpriteNode
    
    var cactusSpeed : CGFloat
    
    var running : Bool = true
    
    override init() {
        
        atlas = SKTextureAtlas(named: "Dinosaurs")
        
        texture = atlas.textureNamed("Cactus")
        
        sprite = SKSpriteNode(texture: texture)
        
        sprite.anchorPoint = CGPoint(x: 0.5, y: 0)
        
        sprite.xScale = scale
        sprite.yScale = scale
        
        cactusSpeed = startSpeed
        
        super.init()
        
        physicsBody = SKPhysicsBody(rectangleOf: sprite.size)
        
        physicsBody?.isDynamic = true
        physicsBody?.usesPreciseCollisionDetection = true
        
        physicsBody?.categoryBitMask = PhysicsCategories.Cactus
        physicsBody?.contactTestBitMask = PhysicsCategories.Dinosaur
        physicsBody?.collisionBitMask = PhysicsCategories.None
        
        addChild(sprite)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(deltaTime: TimeInterval) {
        
        if !running {
            return
        }
        
        position.x -= CGFloat(deltaTime) * 400 * cactusSpeed
        
        if position.x <= frame.width * -0.15 {
            position = Cactus.randomPosition(frameWidth, frameHeight)
            
            cactusSpeed += speedIncrement
        }
    }
    
    static func randomPosition(_ width: CGFloat, _ height: CGFloat) -> CGPoint {
        
        let posX = CGFloat.random(in: width * 2 ... width * 3)
        
        return CGPoint(x: posX, y: height * 0.15)
    }
    
    func stop() {
        running = false
    }
    
    func restart() {
        position = Cactus.randomPosition(frameWidth, frameHeight)
        cactusSpeed = startSpeed
        
        running = true
    }
}

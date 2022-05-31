import SpriteKit
import GameKit

class Cactus : SKNode, Updatable {
    
    let scale : CGFloat = 0.05
    
    var frameWidth : CGFloat = 0
    var frameHeight : CGFloat = 0
    
    var atlas : SKTextureAtlas
    var texture : SKTexture
    
    var sprite : SKSpriteNode
    
    let speedIncrement : CGFloat = 0.02
    var cactusSpeed : CGFloat = 1
    
    override init() {
        
        atlas = SKTextureAtlas(named: "Dinosaurs")
        
        texture = atlas.textureNamed("Cactus")
        
        sprite = SKSpriteNode(texture: texture)
        
        sprite.anchorPoint = CGPoint(x: 0.5, y: 0)
        
        sprite.xScale = scale
        sprite.yScale = scale
        
        super.init()
        
        addChild(sprite)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(currentTime: TimeInterval) {
        position.x += CGFloat(currentTime * -0.001) * cactusSpeed
        
        if position.x <= frame.width * -0.15 {
            position = Cactus.randomPosition(frameWidth, frameHeight)
            
            cactusSpeed += speedIncrement
        }
    }
    
    static func randomPosition(_ width: CGFloat, _ height: CGFloat) -> CGPoint {
        
        let posX = CGFloat.random(in: width * 1.5 ... width * 2)
        
        return CGPoint(x: posX, y: height * 0.15)
    }
}

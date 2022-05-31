import SpriteKit
import GameKit

class Dinosaur : SKNode, Updatable {
    
    let scale : CGFloat = 0.05
    
    var atlas : SKTextureAtlas
    var dinoRunFrames : [SKTexture] = []
    
    var sprite : SKSpriteNode
    
    var verticalSpeed : CGFloat = 0
    
    var grounded : Bool = true
    
    var startingPosY : CGFloat = 0
    
    override init() {
        atlas = SKTextureAtlas(named: "Dinosaurs")
        
        dinoRunFrames.removeAll()
        
        dinoRunFrames.append(atlas.textureNamed("Dino_Run_1"))
        dinoRunFrames.append(atlas.textureNamed("Dino_Run_2"))
        
        sprite = SKSpriteNode(texture: dinoRunFrames[0])
        
        sprite.anchorPoint = CGPoint(x: 0.5, y: 0)
        
        sprite.xScale = scale
        sprite.yScale = scale
        
        let animation = SKAction.animate(with: dinoRunFrames, timePerFrame: 0.1)
        sprite.run(SKAction.repeatForever(animation))
        
        super.init()
        
        addChild(sprite)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(currentTime: TimeInterval) {
        
        position.y += verticalSpeed * CGFloat(currentTime * 0.001)
        
        if position.y <= startingPosY {
            grounded = true
            position.y = startingPosY
        }
        else {
            grounded = false
        }
        
        if !grounded {
            verticalSpeed -= CGFloat(currentTime * 0.000025)
        }
        
    }
    
    func jump() {
        
        verticalSpeed = 2
        
    }
    
}

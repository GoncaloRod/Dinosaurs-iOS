import SpriteKit
import GameKit

class MainMenuScene : SKScene {
    
    override func didMove(to view: SKView) {
        
        backgroundColor = .white
        
        let atlas = SKTextureAtlas(named: "Dinosaurs")
        let image = SKSpriteNode(texture: atlas.textureNamed("Dino_Splash"))
        
        image.position = CGPoint(x: frame.width * 0.5, y: frame.height * 0.6)
        image.xScale = 0.15
        image.yScale = 0.15
        
        let label = SKLabelNode(text: "TOUCH TO PLAY")
        
        label.position = CGPoint(x: frame.width * 0.5, y: frame.height * 0.1)
        label.fontColor = .black
        label.fontSize = 20
        label.fontName = "AlNile"
        
        addChild(image)
        addChild(label)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let gameScene = GameScene(size: size)
        view?.presentScene(gameScene)
        
    }
    
}

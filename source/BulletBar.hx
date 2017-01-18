import flixel.graphics.FlxGraphic;
import flixel.graphics.frames.FlxTileFrames;
import flixel.math.FlxPoint;
import flixel.group.FlxSpriteGroup;
import flixel.FlxSprite;
import flixel.graphics.atlas.FlxNode;
import flixel.graphics.atlas.FlxAtlas;
import flixel.*;
class BulletBar extends FlxSpriteGroup{

    public var currentVal:Int = 0;
    public var id:String;
    var iconTileSet:FlxTileFrames;
    public function new(size:Int=5, defaultVal:Int=0, ?X:Float, ?Y:Float, ?ID:String){
        super(X,Y);
        iconTileSet = ResourceManager.instance.iconTileSheet;
        id = ID;
        for(i in 0...size){
            var sprite:FlxSprite = new FlxSprite(i*16,0);
            if(currentVal<defaultVal){
                sprite.loadGraphic(FlxGraphic.fromFrame(iconTileSet.getByTilePosition(0,0)));
                currentVal++;
            }
            else{
                sprite.loadGraphic(FlxGraphic.fromFrame(iconTileSet.getByTilePosition(1,0)));
            }
            add(sprite);
        }
    }
}
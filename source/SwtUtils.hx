import openfl.Assets;
import flash.display.BitmapData;
import flixel.graphics.atlas.FlxNode;
import flixel.graphics.atlas.FlxAtlas;
import flixel.math.FlxPoint;
import flixel.FlxSprite;
class SwtUtils{

    public static function centerSpriteInRelationTo(Target:FlxSprite, Reference:FlxSprite, ?X:Bool=true, ?Y:Bool=true){
        var point:FlxPoint = Reference.getGraphicMidpoint();
        point.x = point.x-(Target.width/2);
        point.y = point.y-(Target.height/2);
        if(X == false){
            point.x = Target.x;
        }
        if(Y == false){
            point.y = Target.y;
        }
        Target.setPosition(point.x,point.y);
    }

    public static function createNodeAndDisposeBitmap(source:String, atlas:FlxAtlas):FlxNode
	{
		var bitmap:BitmapData = Assets.getBitmapData(source);
		var node:FlxNode = atlas.addNode(bitmap, source);
		Assets.cache.removeBitmapData(source);
		bitmap.dispose();
		return node;
	}
}
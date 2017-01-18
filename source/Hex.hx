import flixel.FlxG;
import flixel.graphics.frames.FlxFrame;
 import flixel.FlxSprite;
 import flixel.graphics.FlxGraphic;
 import flixel.system.FlxAssets.FlxGraphicAsset;


enum Direction {
    N;
    NE;
    SE;
    S;
    SW;
    NW;
}

 class Hex extends FlxSprite
 {
    

     public var c:Int;
     public var r:Int;
     var tileMap:Map<String, FlxFrame> = new Map<String, FlxFrame>();
     public var neighbors:Map<Direction, Hex> = new Map<Direction, Hex>(); 
     public var tileGraphic:FlxGraphic;

     public function new(?C:Int=0, ?R:Int=0, TileMap:Map<String, FlxFrame>, ?TileType:String)
     {
         var  MAGIC_WIDTH:Float = 25; //Since we're using pixel art which means we only have approximate hexes, this number has to be manually determined by counting pixels
         c = C;
         r = R;
         tileMap = TileMap;
         tileGraphic = FlxGraphic.fromFrame(tileMap.get(TileType));

         var xPos = (c*MAGIC_WIDTH)-tileGraphic.width/2.0;
         var yPos = ((r+c/2.0)*tileGraphic.height)-tileGraphic.height/2.0;
         

         super(xPos, yPos);
         loadGraphic(tileGraphic);
     }

     public function changeTileType(TileType:String){
         tileGraphic = FlxGraphic.fromFrame(tileMap.get(TileType));
         loadGraphic(tileGraphic);
     }
 }
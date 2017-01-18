import flixel.math.FlxPoint;
import flixel.graphics.atlas.FlxNode;
import flixel.graphics.atlas.FlxAtlas;
import flixel.graphics.frames.FlxFrame;
import flixel.graphics.frames.FlxTileFrames;
import flixel.graphics.FlxGraphic;
import flixel.*;

class ResourceManager {
  // read-only property
  public static var instance(default, null):ResourceManager = new ResourceManager();

  public var iconTileSheet:FlxTileFrames;
  public var mapTileSheet:FlxTileFrames;
  public var humanoidPaperDoll:FlxGraphic;
  public var humanoidLeg:FlxGraphic;
  public var humanoidArm:FlxGraphic;
  public var humanoidHead:FlxGraphic;
  public var humanoidBody:FlxGraphic;
  
  private function new () {}

  public function initialize(){
        iconTileSheet = loadSpriteSheet(16, 16, AssetPaths.bullets__png, "icons");
        mapTileSheet = loadSpriteSheet(32, 32, AssetPaths.HexTilesetv3__png, "tileset");
        humanoidPaperDoll = FlxGraphic.fromAssetKey(AssetPaths.HumanModel__png);
        humanoidArm = FlxGraphic.fromAssetKey(AssetPaths.human_arm__png);
        humanoidBody = FlxGraphic.fromAssetKey(AssetPaths.human_torso__png);
        humanoidLeg = FlxGraphic.fromAssetKey(AssetPaths.human_leg__png);
        humanoidHead = FlxGraphic.fromAssetKey(AssetPaths.human_head__png);
  } 
  
  private function loadSpriteSheet(Width:Float, Height:Float, AssetPath:Dynamic, Name:String){
        var atlas:FlxAtlas = new FlxAtlas(Name, true);
        var node:FlxNode = SwtUtils.createNodeAndDisposeBitmap(AssetPath, atlas);
        var size:FlxPoint = FlxPoint.get(Width, Height);
        return node.getTileFrames(size);
  }
}
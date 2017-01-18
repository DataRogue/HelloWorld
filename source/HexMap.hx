package;

import flixel.text.FlxText;
import flixel.FlxSubState;
import flixel.graphics.frames.FlxFrame;
import flixel.graphics.frames.FlxTileFrames;
import flixel.math.FlxPoint;
import flash.display.BitmapData;
import flixel.graphics.atlas.FlxAtlas;
import flixel.graphics.atlas.FlxNode;
import flixel.FlxG;
import openfl.Assets;

class HexMap extends FlxSubState
{
    
	var tileMap:Map<String, FlxFrame>;

    var activeHexMap:TableArray;
	var WIDTH:Int = 10;
	var HEIGHT:Int = 5;
	override public function create():Void
	{		
		tileMap = generateTileMap();
        FlxG.log.add(tileMap);
        FlxG.camera.focusOn(FlxPoint.get(0,0));

		activeHexMap = new TableArray(WIDTH, HEIGHT);
        drawBlankHexMap(WIDTH,HEIGHT);
		generateHexNeighbors();

		createSouthernOcean(2);
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}

	public function createSouthernOcean(Depth:Int):Void{
		var opArray:Array<Hex> = new Array<Hex>();
		for (i in 0...Depth){
			opArray = opArray.concat(activeHexMap.getHorizontalArray(HEIGHT-1-i));
		}
		for(hex in opArray){
			if(hex!= null){
				hex.changeTileType("water");
			}
		}
	}

    public function drawBlankHexMap(Width:Int, Height:Int):Void{
        for (i in -Width...Width+1){
            for (j in -(Height*2)...(Height*2)+1){
                if(Math.abs((i/2)+j)>Height){
                    continue;
                }
                if(i == 0 && j == 0){
					activeHexMap.setHexAt(generateNewHexAt(i, j, "snow"),i,j);
                    continue;
                }
				activeHexMap.setHexAt(generateNewHexAt(i, j, "grass"),i,j);
            }
        }
    }

    public function generateNewHexAt(C:Float,R:Float,TileType:String):Hex{
		var hex = new Hex(Std.int(C),Std.int(R),tileMap,TileType);
        add(hex);
        add(new FlxText(hex.x+4, hex.y+4, 32, ("C:"+C+", R:"+R)));
        return hex;
    }

	private function generateHexNeighbors(){
		for (i in 0...activeHexMap.colArray.length){
			for (j in 0...activeHexMap.colArray[i].length){
				var hex:Hex = activeHexMap.colArray[i][j];
				if(hex== null){
					continue;
				}
				hex.neighbors.set(Hex.Direction.N, activeHexMap.getHexAt(hex.c,hex.r-1));
				hex.neighbors.set(Hex.Direction.NE, activeHexMap.getHexAt(hex.c+1,hex.r-1));
				hex.neighbors.set(Hex.Direction.SE, activeHexMap.getHexAt(hex.c+1,hex.r));
				hex.neighbors.set(Hex.Direction.S, activeHexMap.getHexAt(hex.c,hex.r+1));
				hex.neighbors.set(Hex.Direction.SW, activeHexMap.getHexAt(hex.c-1,hex.r+1));
				hex.neighbors.set(Hex.Direction.NW, activeHexMap.getHexAt(hex.c-1,hex.r));
			}
		}
	}

	private function generateTileMap():Map<String, FlxFrame>{
		/*
		var tileMapAtlas:FlxAtlas = new FlxAtlas("tilset", true);
		var tilesNode:FlxNode = SwtUtils.createNodeAndDisposeBitmap(AssetPaths.HexTilesetv3__png, tileMapAtlas);
		var tileSize:FlxPoint = FlxPoint.get(32, 32);
		var tileFrames:FlxTileFrames = tilesNode.getTileFrames(tileSize);
		*/
		haxe.Log.trace(ResourceManager.instance.test);
		var tileFrames:FlxTileFrames = ResourceManager.instance.mapTileSheet;
		var tileDict:Map<String, FlxFrame> = new Map<String, FlxFrame>();
		tileDict.set("select", tileFrames.getByTilePosition(0, 0));
		tileDict.set("snow", tileFrames.getByTilePosition(1,0));
		tileDict.set("grass", tileFrames.getByTilePosition(0,1));
		tileDict.set("dirt", tileFrames.getByTilePosition(1,1));
		tileDict.set("water", tileFrames.getByTilePosition(2,1));

		return tileDict;
	}
}

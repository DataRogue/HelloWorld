package;

import flixel.graphics.frames.FlxFrame;
import flixel.graphics.frames.FlxTileFrames;
import flixel.math.FlxPoint;
import flash.display.BitmapData;
import flixel.graphics.atlas.FlxAtlas;
import flixel.graphics.atlas.FlxNode;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import openfl.Assets;

class PlayState extends FlxState
{
	override public function create():Void
	{
		var rm = ResourceManager.instance;
		rm.initialize();
		//openSubState(new HexMap());
		//openSubState(new EncounterState());
		openSubState(new MenuState());
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}

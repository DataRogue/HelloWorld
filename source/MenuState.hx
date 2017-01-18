package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

class MenuState extends FlxSubState
{
	private var _btnPlay:FlxButton;
	override public function create():Void
	{
		
		super.create();
		_btnPlay = new FlxButton(0,0,"Play", clickPlay);
		_btnPlay.screenCenter();
		add(_btnPlay);
		var entity = new Entity(haxe.Json.parse(sys.io.File.getContent(AssetPaths.player__json)));
		add(SwtUI.drawStatSheet(entity));
		//add(new FlxText(0,0,0, "Hello World!"));
	}

	private function clickPlay():Void{
		FlxG.switchState(new PlayState());
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}

package;

import flixel.util.FlxColor;
import flixel.graphics.FlxGraphic;
import flixel.FlxSubState;
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
import flixel.addons.ui.FlxUI9SliceSprite;
import openfl.Assets;

class EncounterState extends FlxSubState
{
    public var mainPanel:FlxSprite;
    public var titlePanel:FlxSprite;
    public var titleText:FlxText;
    public var descriptionText:FlxText;

    public function initiateEncounter(event):Void{

    }

    public function drawBaseEncounter(event):Void{
        mainPanel = SwtUI.drawPanel(0,0,400,450);
        mainPanel.screenCenter();
        add(mainPanel);

        titlePanel = SwtUI.drawPanel(mainPanel.x+20, mainPanel.y+10, 360, 32);
        add(titlePanel);

        titleText = new FlxText(titlePanel.x+8, titlePanel.y+8, 344, event.title, 12);
        titleText.alignment = flixel.text.FlxTextAlign.CENTER;
        add(titleText);

        descriptionText = new FlxText(titlePanel.x, titlePanel.y+titlePanel.height+8, 360, event.description);
        add(descriptionText);
    }

	override public function create():Void
	{
        var eventsJSON = haxe.Json.parse(sys.io.File.getContent(AssetPaths.events__json));
        drawBaseEncounter(eventsJSON.banditEncounter);
        
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}

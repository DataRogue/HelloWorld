import flixel.FlxGame;
import openfl.Lib;
import flixel.*;
import flixel.text.FlxText;
import flixel.group.*;
import flixel.addons.ui.FlxUI9SliceSprite;

class SwtUI
{
    public var panelSprite:FlxUI9SliceSprite;
    
	public function new()
	{

	}

    public static function drawPanel(X:Float, Y:Float, Height:Float, Width:Float, ?Graphic:Dynamic=AssetPaths.tempGui__png):FlxSprite{
        var sprite:FlxUI9SliceSprite = new FlxUI9SliceSprite(X,Y, Graphic, new flash.geom.Rectangle(0,0,Height,Width), [8,8,56,56], 0x11);
        return sprite;
    }

    public static function drawStatSheet(entity:Entity):FlxGroup{
        var group:FlxGroup = new FlxGroup();
        var panel:FlxSprite = SwtUI.drawPanel(0,0,440,450);
        group.add(panel);

        var body:FlxSpriteGroup = SwtUI.drawBody(entity.body);
        body.setPosition(20, 20);
        group.add(body);

        var attrs:FlxSpriteGroup = SwtUI.drawAttributes(entity.attributes);
        attrs.setPosition(250, 20);
        group.add(attrs);
        return group;
    }

    private static function drawBody(body:Entity.HumanoidBody):FlxSpriteGroup{
        var bodyGroup:FlxSpriteGroup = new FlxSpriteGroup();
        var bodyBackground = SwtUI.drawPanel(0,0,220,256, AssetPaths.darken_gui__png);

        //var bodySprite = new FlxSprite(0,0);
        //bodySprite.loadGraphic(AssetPaths.HumanModel__png);

        var bodySprite:FlxSpriteGroup = new PaperDoll();
        SwtUtils.centerSpriteInRelationTo(bodySprite, bodyBackground);

        bodyGroup.add(bodyBackground);
        bodyGroup.add(bodySprite);
        return bodyGroup;
    }

    private static function drawAttributes(attributes:Entity.Attributes):FlxSpriteGroup{
        var attributesGroup:FlxSpriteGroup = new FlxSpriteGroup();

        var fields = Reflect.fields(attributes);
        var i:Int=0;
        for (field in fields) {
            var value = Reflect.getProperty(attributes, field);
            var label:FlxText = new FlxText(0, 16*i, 50, (field.substring(0,1).toUpperCase()+field.substring(1)));
            var bulletBar:FlxSprite = new BulletBar(5, value, 50, 16*i);
            attributesGroup.add(label);
            attributesGroup.add(bulletBar);
            i++;
            trace(value);
        }

        return attributesGroup;
    }
    
}

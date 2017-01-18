import flixel.graphics.FlxGraphic;
import flixel.graphics.frames.FlxTileFrames;
import flixel.math.FlxPoint;
import flixel.group.FlxSpriteGroup;
import flixel.FlxSprite;
import flixel.graphics.atlas.FlxNode;
import flixel.graphics.atlas.FlxAtlas;
import flixel.input.mouse.FlxMouseEventManager;
import flixel.*;

class PaperLimb extends FlxSprite {
    public var name:String;
    public var selfSprite:FlxSprite;
    public function new(?X:Float, ?Y:Float, Name:String){
        super(X,Y);
        name = Name;
        selfSprite = this;
    }
}

class PaperDoll extends FlxSpriteGroup{

    public var currentVal:Int = 0;
    public var id:String;
    public var bodyType:String = "Humanoid";
    public function new(?X:Float, ?Y:Float, ?Hoverable:Bool=true){
        super(X,Y);
        var head:FlxSprite = new PaperLimb(0,0, "head");
        var body:FlxSprite = new PaperLimb(0,0, "body");
        var lArm:FlxSprite = new PaperLimb(0,0, "L.Arm");
        var rArm:FlxSprite = new PaperLimb(0,0, "R.Arm");
        var lLeg:FlxSprite = new PaperLimb(0,0, "L.Leg");
        var rLeg:FlxSprite = new PaperLimb(0,0, "R.Leg");

        head.loadGraphic(ResourceManager.instance.humanoidHead);
        body.loadGraphic(ResourceManager.instance.humanoidBody);
        lArm.loadGraphic(ResourceManager.instance.humanoidArm);
        rArm.loadGraphic(ResourceManager.instance.humanoidArm);
        lLeg.loadGraphic(ResourceManager.instance.humanoidLeg);
        rLeg.loadGraphic(ResourceManager.instance.humanoidLeg);

        body.setPosition(lArm.width, head.height);

        head.setPosition(0,body.y-head.height);
        SwtUtils.centerSpriteInRelationTo(head,body,true,false);

        lArm.setPosition(body.x-lArm.width, body.y+2);
        rArm.setPosition(body.x+rArm.width+20, body.y+2);
        rArm.setFacingFlip(FlxObject.LEFT, true, false);
        rArm.facing = FlxObject.LEFT;

        lLeg.setPosition(body.x-23, body.y+body.height-2);

        rLeg.setPosition(body.x+25, body.y+body.height-2);
        rLeg.setFacingFlip(FlxObject.LEFT, true, false);
        rLeg.facing = FlxObject.LEFT;

        add(head);
        add(body);
        add(lArm);
        add(rArm);
        add(lLeg);
        add(rLeg);

        FlxMouseEventManager.add(head, onMouseDown, onMouseUp, onMouseOver, onMouseOut); 
        FlxMouseEventManager.add(body, onMouseDown, onMouseUp, onMouseOver, onMouseOut); 
        FlxMouseEventManager.add(lArm, onMouseDown, onMouseUp, onMouseOver, onMouseOut); 
        FlxMouseEventManager.add(rArm, onMouseDown, onMouseUp, onMouseOver, onMouseOut); 
        FlxMouseEventManager.add(lLeg, onMouseDown, onMouseUp, onMouseOver, onMouseOut); 
        FlxMouseEventManager.add(rLeg, onMouseDown, onMouseUp, onMouseOver, onMouseOut); 
    }

    public function onMouseDown(limb:Dynamic):Void{

    }
    public function onMouseOver(limb:Dynamic):Void{
        var sprite:FlxSprite = limb.selfSprite;
        sprite.color = 0x56d349;
    }
    public function onMouseOut(limb:Dynamic):Void{
        var sprite:FlxSprite = limb.selfSprite;
        sprite.color =  0xffffff;
    }
    public function onMouseUp(limb:Dynamic):Void{

    }
}
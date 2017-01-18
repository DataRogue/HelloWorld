package;

import flixel.FlxGame;
import openfl.Lib;
import openfl.display.Sprite;

class TableArray
{
    public var colArray:Array<Array<Hex>>;
    var heightArray: Array<Array<Hex>>;
    var width:Int;
    var height:Int;
	public function new(Width:Int, Height:Int)
	{
        width = Width*2;
        height = Height*2;
        //Write my own 2D array declaration code
		colArray = generate2DArray(Width*4+1);
        heightArray = generate2DArray(Height*4+1);
	}

    public function setHexAt(hex:Hex, c, r):Void{
        colArray[intToColInd(c)][intToRowInd(r)] = hex;
        heightArray[intToRowInd(Math.floor(hex.y/hex.tileGraphic.height))][intToColInd(c)] = hex;
    }

    public function getHexAt(c,r):Hex{
        return colArray[intToColInd(c)][intToRowInd(r)];
    }

    public function intToColInd(i:Int):Int{
        return i+width;
    }

    public function intToRowInd(i:Int):Int{
        return i+height;
    }

    public function getRowArray(r):Array<Hex>{
        return colArray[intToColInd(r)];
    }

    public function getHorizontalArray(y):Array<Hex>{
        return heightArray[intToRowInd(y)];
    }

    public function getColumnArray(c):Array<Hex>{
        var returnArr:Array<Hex> = new Array<Hex>();
        var i:Int = 0;
        for(arr in colArray){
            returnArr[i] = arr[intToRowInd(c)];
            i++;
        }
        return returnArr;
    }

    public function generate2DArray(size:Int):Array<Array<Hex>>{
        var returnArr = new Array();
        
        for(i in 0...size){
            returnArr[i] = new Array();
        }
        return returnArr;
    }
}

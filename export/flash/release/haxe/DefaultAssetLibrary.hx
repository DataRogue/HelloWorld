package;


import haxe.Timer;
import haxe.Unserializer;
import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import lime.utils.AssetType;
import lime.utils.Bytes;
import lime.utils.Log;

#if sys
import haxe.io.Path;
import sys.FileSystem;
#end


@:keep class DefaultAssetLibrary extends AssetLibrary {
	
	
	private var lastModified:Float;
	private var timer:Timer;
	
	#if (windows && !cs)
	private var rootPath = FileSystem.absolutePath (Path.directory (#if (haxe_ver >= 3.3) Sys.programPath () #else Sys.executablePath () #end)) + "/";
	#else
	private var rootPath = "";
	#end
	
	
	public function new () {
		
		super ();
		
		#if (openfl && !flash)
		
		
		
		
		
		
		
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_monsterrat_ttf);
		
		
		
		#end
		
		#if flash
		
		classTypes.set ("assets/data/data-goes-here.txt", __ASSET__assets_data_data_goes_here_txt);
		types.set ("assets/data/data-goes-here.txt", AssetType.TEXT);
		classTypes.set ("assets/images/images-go-here.txt", __ASSET__assets_images_images_go_here_txt);
		types.set ("assets/images/images-go-here.txt", AssetType.TEXT);
		classTypes.set ("assets/music/music-goes-here.txt", __ASSET__assets_music_music_goes_here_txt);
		types.set ("assets/music/music-goes-here.txt", AssetType.TEXT);
		classTypes.set ("assets/sounds/sounds-go-here.txt", __ASSET__assets_sounds_sounds_go_here_txt);
		types.set ("assets/sounds/sounds-go-here.txt", AssetType.TEXT);
		classTypes.set ("flixel/sounds/beep.mp3", __ASSET__flixel_sounds_beep_mp3);
		types.set ("flixel/sounds/beep.mp3", AssetType.MUSIC);
		classTypes.set ("flixel/sounds/flixel.mp3", __ASSET__flixel_sounds_flixel_mp3);
		types.set ("flixel/sounds/flixel.mp3", AssetType.MUSIC);
		classTypes.set ("flixel/fonts/nokiafc22.ttf", __ASSET__flixel_fonts_nokiafc22_ttf);
		types.set ("flixel/fonts/nokiafc22.ttf", AssetType.FONT);
		classTypes.set ("flixel/fonts/monsterrat.ttf", __ASSET__flixel_fonts_monsterrat_ttf);
		types.set ("flixel/fonts/monsterrat.ttf", AssetType.FONT);
		classTypes.set ("flixel/images/ui/button.png", __ASSET__flixel_images_ui_button_png);
		types.set ("flixel/images/ui/button.png", AssetType.IMAGE);
		classTypes.set ("flixel/images/logo/default.png", __ASSET__flixel_images_logo_default_png);
		types.set ("flixel/images/logo/default.png", AssetType.IMAGE);
		
		
		#elseif html5
		
		var id;
		id = "assets/data/data-goes-here.txt";
		paths.set (id, id);
		
		types.set (id, AssetType.TEXT);
		id = "assets/images/images-go-here.txt";
		paths.set (id, id);
		
		types.set (id, AssetType.TEXT);
		id = "assets/music/music-goes-here.txt";
		paths.set (id, id);
		
		types.set (id, AssetType.TEXT);
		id = "assets/sounds/sounds-go-here.txt";
		paths.set (id, id);
		
		types.set (id, AssetType.TEXT);
		id = "flixel/sounds/beep.mp3";
		paths.set (id, id);
		
		types.set (id, AssetType.MUSIC);
		id = "flixel/sounds/flixel.mp3";
		paths.set (id, id);
		
		types.set (id, AssetType.MUSIC);
		id = "flixel/fonts/nokiafc22.ttf";
		classTypes.set (id, __ASSET__flixel_fonts_nokiafc22_ttf); preload.set (id, true);
		
		types.set (id, AssetType.FONT);
		id = "flixel/fonts/monsterrat.ttf";
		classTypes.set (id, __ASSET__flixel_fonts_monsterrat_ttf); preload.set (id, true);
		
		types.set (id, AssetType.FONT);
		id = "flixel/images/ui/button.png";
		paths.set (id, id);
		
		types.set (id, AssetType.IMAGE);
		id = "flixel/images/logo/default.png";
		paths.set (id, id);
		
		types.set (id, AssetType.IMAGE);
		
		
		var assetsPrefix = null;
		if (ApplicationMain.config != null && Reflect.hasField (ApplicationMain.config, "assetsPrefix")) {
			assetsPrefix = ApplicationMain.config.assetsPrefix;
		}
		if (assetsPrefix != null) {
			for (k in paths.keys()) {
				paths.set(k, assetsPrefix + paths[k]);
			}
		}
		
		for (id in paths.keys()) {
			preload.set (id, true);
		}
		
		#else
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		
		classTypes.set ("assets/data/data-goes-here.txt", __ASSET__assets_data_data_goes_here_txt);
		types.set ("assets/data/data-goes-here.txt", AssetType.TEXT);
		
		classTypes.set ("assets/images/images-go-here.txt", __ASSET__assets_images_images_go_here_txt);
		types.set ("assets/images/images-go-here.txt", AssetType.TEXT);
		
		classTypes.set ("assets/music/music-goes-here.txt", __ASSET__assets_music_music_goes_here_txt);
		types.set ("assets/music/music-goes-here.txt", AssetType.TEXT);
		
		classTypes.set ("assets/sounds/sounds-go-here.txt", __ASSET__assets_sounds_sounds_go_here_txt);
		types.set ("assets/sounds/sounds-go-here.txt", AssetType.TEXT);
		
		classTypes.set ("flixel/sounds/beep.mp3", __ASSET__flixel_sounds_beep_mp3);
		types.set ("flixel/sounds/beep.mp3", AssetType.MUSIC);
		
		classTypes.set ("flixel/sounds/flixel.mp3", __ASSET__flixel_sounds_flixel_mp3);
		types.set ("flixel/sounds/flixel.mp3", AssetType.MUSIC);
		
		classTypes.set ("flixel/fonts/nokiafc22.ttf", __ASSET__flixel_fonts_nokiafc22_ttf);
		types.set ("flixel/fonts/nokiafc22.ttf", AssetType.FONT);
		
		classTypes.set ("flixel/fonts/monsterrat.ttf", __ASSET__flixel_fonts_monsterrat_ttf);
		types.set ("flixel/fonts/monsterrat.ttf", AssetType.FONT);
		
		classTypes.set ("flixel/images/ui/button.png", __ASSET__flixel_images_ui_button_png);
		types.set ("flixel/images/ui/button.png", AssetType.IMAGE);
		
		classTypes.set ("flixel/images/logo/default.png", __ASSET__flixel_images_logo_default_png);
		types.set ("flixel/images/logo/default.png", AssetType.IMAGE);
		
		
		if (useManifest) {
			
			loadManifest ();
			
			if (false && Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				
				if (FileSystem.exists (path)) {
					
					lastModified = FileSystem.stat (path).mtime.getTime ();
					
					timer = new Timer (2000);
					timer.run = function () {
						
						var modified = FileSystem.stat (path).mtime.getTime ();
						
						if (modified > lastModified) {
							
							lastModified = modified;
							loadManifest ();
							
							onChange.dispatch ();
							
						}
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		#end
		
	}
	
	
	#if (!flash && !html5)
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var manifest = AssetManifest.fromFile ("app/native/manifest");
			#elseif tizen
			var manifest = AssetManifest.fromFile ("../res/manifest");
			#elseif emscripten
			var manifest = AssetManifest.fromFile ("assets/manifest");
			#elseif (mac && java)
			var manifest = AssetManifest.fromFile ("../Resources/manifest");
			#elseif (ios || tvos)
			var manifest = AssetManifest.fromFile ("assets/manifest");
			#else
			var manifest = AssetManifest.fromFile ("manifest");
			#end
			
			if (manifest != null) {
				
				for (asset in manifest.assets) {
					
					if (!classTypes.exists (asset.id)) {
						
						#if (ios || tvos)
						paths.set (asset.id, rootPath + "assets/" + asset.path);
						#else
						paths.set (asset.id, rootPath + asset.path);
						#end
						types.set (asset.id, cast (asset.type, AssetType));
						
					}
					
				}
				
			} else {
				
				Log.warn ("Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			Log.warn ('Could not load asset manifest (${e})');
			
		}
		
	}
	#end
	
	
}


#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__assets_data_data_goes_here_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_images_go_here_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_music_goes_here_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_images_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }


#elseif html5







@:keep #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { super (); name = "Nokia Cellphone FC Small"; } } 
@:keep #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { super (); name = "Monsterrat"; } } 




#else



#if (windows || mac || linux || cpp)


@:file("assets/data/data-goes-here.txt") #if display private #end class __ASSET__assets_data_data_goes_here_txt extends haxe.io.Bytes {}
@:file("assets/images/images-go-here.txt") #if display private #end class __ASSET__assets_images_images_go_here_txt extends haxe.io.Bytes {}
@:file("assets/music/music-goes-here.txt") #if display private #end class __ASSET__assets_music_music_goes_here_txt extends haxe.io.Bytes {}
@:file("assets/sounds/sounds-go-here.txt") #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends haxe.io.Bytes {}
@:file("/usr/local/lib/haxe/lib/flixel/4,2,0/assets/sounds/beep.mp3") #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends haxe.io.Bytes {}
@:file("/usr/local/lib/haxe/lib/flixel/4,2,0/assets/sounds/flixel.mp3") #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends haxe.io.Bytes {}
@:font("/usr/local/lib/haxe/lib/flixel/4,2,0/assets/fonts/nokiafc22.ttf") #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:font("/usr/local/lib/haxe/lib/flixel/4,2,0/assets/fonts/monsterrat.ttf") #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:image("/usr/local/lib/haxe/lib/flixel/4,2,0/assets/images/ui/button.png") #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:image("/usr/local/lib/haxe/lib/flixel/4,2,0/assets/images/logo/default.png") #if display private #end class __ASSET__flixel_images_logo_default_png extends lime.graphics.Image {}



#end
#end

#if (openfl && !flash)
@:keep #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__flixel_fonts_nokiafc22_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__flixel_fonts_monsterrat_ttf (); src = font.src; name = font.name; super (); }}

#end

#end

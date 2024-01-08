package sdl_image;

import sdl.Types;
import sdl.Types.Surface;
import sdl.Types.Renderer;
import sdl.Types.Texture;
import sdl.Types.RWops;
import sdl_image.Types;
import sdl_image.Types.ImageInitFlags;
import cpp.ConstCharStar;

@:include("vendor/include/Headers.h")
@:buildXml("<include name=\"${haxelib:hxsdl_image}/include.xml\"/>")

// WARNING: This will not have every feature SDL Image has to offer!
//
// Make an issue explaining what feature you want implemented over on GitHub!
// https://github.com/swordcube/hxsdl_image/issues

extern class Image {
    @:native("IMG_Init")
    static function init(flags:ImageInitFlags):Int;

    @:native("IMG_Quit")
    static function quit():Void;
    
    @:native("IMG_Load")
    static function load(file:ConstCharStar):Surface;

    @:native("IMG_LoadTexture")
    static function loadTexture(renderer:Renderer, file:ConstCharStar):Texture;

    @:native("IMG_LoadTyped_RW")
    static inline function loadTypedRW(src:RWops, freeSrc:Bool, type:ConstCharStar):Surface {
    	return untyped __cpp__("IMG_LoadTypedRW({0}, (SDL_bool){1}, {2})", src, freeSrc, type);
    }
}
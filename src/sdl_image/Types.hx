package sdl_image;

import cpp.UInt32;

class Types {}

enum abstract ImageInitFlags(UInt32) from UInt32 to UInt32 {
	var JPG = 0x00000001;
	var PNG = 0x00000002;
	var TIF = 0x00000004;
	var WEBP = 0x00000008;
	var JXL = 0x00000010;
	var AVIF = 0x00000020;
    var EVERYTHING = 0x00000001 | 0x00000002 | 0x00000004 | 0x00000008 | 0x00000010 | 0x00000020;
}
rec {
  AppKit = [ "CoreData" "Foundation" "QuartzCore" ];
  ApplicationServices = [ "CoreGraphics" "CoreText" "ImageIO" ];
  AudioUnit = [ "CoreAudio" ];
  AudioToolbox = [ "CoreMIDI" ];
  Carbon = [ "ApplicationServices" ];
  Cocoa = [ "AppKit" ];
  CoreGraphics = [ "IOSurface" ];
  CoreImage = [ "CoreVideo" ];
  CoreServices = [ "CFNetwork" "DiskArbitration" "Security" ];
  CoreVideo = [ "OpenGL" ];
  DiskArbitration = [ "IOKit" ];
  Foundation = [ "ApplicationServices" ];
  QuartzCore = [ "CoreImage" ];
}

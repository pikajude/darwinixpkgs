rec {
  AppKit = [ "CoreData" "Foundation" "QuartzCore" ];
  ApplicationServices = [ "CoreGraphics" "CoreText" "ImageIO" ];
  AudioUnit = [ "AudioToolbox" ];
  AudioToolbox = [ "CoreAudio" "CoreMIDI" ];
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

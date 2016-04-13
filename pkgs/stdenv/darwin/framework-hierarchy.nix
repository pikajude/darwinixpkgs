rec {
  AppKit = [ "CoreData" "Foundation" "QuartzCore" ];
  ApplicationServices = [ "CoreGraphics" "CoreText" "ImageIO" ];
  Carbon = [ "ApplicationServices" ];
  CoreGraphics = [ "IOSurface" ];
  CoreImage = [ "CoreVideo" ];
  CoreServices = [ "CFNetwork" "DiskArbitration" "Security" ];
  CoreVideo = [ "OpenGL" ];
  DiskArbitration = [ "IOKit" ];
  Foundation = [ "ApplicationServices" ];
  QuartzCore = [ "CoreImage" ];
}

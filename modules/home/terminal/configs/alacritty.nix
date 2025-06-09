{lib, ...}: {
  env.WINIT_X11_SCALE_FACTOR = "1.0";

  window = {
    padding = { x = 15; y = 15; };
    dynamic_padding = true;
  };
  
  cursor = {
    style.blinking = "Always";
    unfocused_hollow = false;
  };

  mouse.hide_when_typing = true;
}

_level0.transOut();
if(_root.netPlay_bool && typeX != "esc")
{
   if(_root.lan == "cn" || _root.lan == "cn2")
   {
      gotoAndStop("netPlay_screen");
   }
   else
   {
      gotoAndStop("netPlay_screen_en");
   }
}
else if(typeX == "esc")
{
   gotoAndStop("menu");
   typeX = "";
}
else
{
   stopAllSounds();
   _level0.gotoAndStop("charSelect");
}

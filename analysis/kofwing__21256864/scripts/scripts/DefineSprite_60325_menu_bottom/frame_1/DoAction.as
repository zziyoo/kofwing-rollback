function exit()
{
}
function gotoMenu(type)
{
   if(menu_now != "")
   {
      _quality = _root.quality2;
      menu_now = "";
      gotoAndStop(1);
      return undefined;
   }
   menu_now = type;
   _quality = _root.quality1;
   gotoAndStop(type);
}
stop();
var menu_now = "";

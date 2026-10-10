function gotoMenu2(dir)
{
   if(dir == "up")
   {
      menu_nowTwo--;
   }
   else if(dir == "down")
   {
      menu_nowTwo++;
   }
   if(menu_nowTwo < 1)
   {
      menu_nowTwo = menu_allTwo;
   }
   else if(menu_nowTwo > menu_allTwo)
   {
      menu_nowTwo = 1;
   }
   var _loc1_ = menu_nowTwo.toString();
   mc.select_icon._y = mc["option_" + _loc1_]._y;
   _level0.select_snd.start();
}
function select2()
{
   if(selectOK2)
   {
      return undefined;
   }
   selectOK2 = true;
   _level0.ok_snd.start();
   switch(menu_nowTwo)
   {
      case 1:
         type2 = "key";
         play();
         break;
      case 2:
         type2 = "display";
         play();
         break;
      case 3:
         type2 = "fights";
         play();
         break;
      case 4:
         type2 = "key";
         play();
      default:
         return;
   }
}
stop();
var type2 = "";
type2 = "";
var selectOK2 = false;
var menu_nowTwo;
var menu_allTwo = 3;
if(menu_nowTwo == undefined)
{
   menu_nowTwo = 1;
}

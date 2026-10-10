function gotoMenu(dir)
{
   if(dir == "up")
   {
      menu_now--;
   }
   else if(dir == "down")
   {
      menu_now++;
   }
   if(menu_now < 1)
   {
      menu_now = menu_all;
   }
   else if(menu_now > menu_all)
   {
      menu_now = 1;
   }
   showIcon(menu_now);
   if(_level0.SE_old)
   {
      _level0.selectMenu_snd.start();
   }
   else
   {
      _level0.selectMenu02um_snd.start();
   }
}
function select()
{
   if(selectOK)
   {
      return undefined;
   }
   _level0.ok_snd.start();
   selectOK = true;
   if(!_level0.autoPlayGame && !_level0.autoSelectRank)
   {
      _level0.menu_now = menu_now;
   }
   if(menu_now == 1)
   {
      _level0.player_type = "1PVSCOM";
      _level0.P1_type = "player";
      _level0.P2_type = "cpu";
      type = "";
      _level0.cpu_list = _level0.getCPUList();
      play();
   }
   else if(menu_now == 2)
   {
      _level0.player_type = "vs";
      _level0.P1_type = "player";
      _level0.P2_type = "cpu";
      type = "";
      play();
   }
   else if(menu_now == 3)
   {
      _level0.player_type = "1PVS2P";
      _level0.P1_type = "player";
      _level0.P2_type = "player";
      type = "";
      play();
   }
   else if(menu_now == 4)
   {
      _level0.player_type = "COMVSCOM";
      _level0.P1_type = "cpu";
      _level0.P2_type = "cpu";
      type = "";
      play();
   }
   else if(menu_now == 5)
   {
      _level0.player_type = "trainning";
      _level0.P1_type = "player";
      _level0.P2_type = "player";
      _level0.lifeBar_num = -1;
      _level0.playTime = -1;
      type = "";
      play();
   }
   else if(menu_now == 6)
   {
      stopAllSounds();
      type = "intro";
      play();
   }
   else if(menu_now == 7)
   {
      type = "setting";
      play();
   }
   else if(menu_now == 8)
   {
      type = "credits";
      play();
   }
   else if(menu_now == 9)
   {
      stopAllSounds();
      type = "rank";
      play();
   }
}
function showIcon(id)
{
   var _loc1_ = 1;
   while(_loc1_ < 10)
   {
      mc["option" + _loc1_ + "_mc"].gotoAndStop(1);
      _loc1_ = _loc1_ + 1;
   }
   menu_now = id;
   mc["option" + id + "_mc"].gotoAndStop(2);
}
stop();
if(_level0.autoSelectRank)
{
   menu_now = 9;
   showIcon(9);
   select();
}
else if(_level0.autoPlayGame)
{
   menu_now = 4;
   showIcon(4);
   select();
}
var type;
var selectOK = false;
var menu_now = _level0.menu_now;
var menu_all = 9;
if(menu_now == undefined)
{
   menu_now = 1;
}

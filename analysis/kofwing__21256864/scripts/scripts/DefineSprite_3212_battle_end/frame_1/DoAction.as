stop();
var type;
var isPlay = false;
this.onEnterFrame = function()
{
   if(_level0.timeOver)
   {
      if(_level0.P1_role.life == _level0.P2_role.life)
      {
         type = "draw";
         isPlay = true;
         play();
      }
      else if((_level0.P1_role.status_2 == "land" || _level0.P1_role.status_2 == "toLand") && _level0.P1_role.status_3 == "normal" && ((_level0.P2_role.status_2 == "land" || _level0.P1_role.status_2 == "toLand") && _level0.P2_role.status_3 == "normal"))
      {
         type = "win";
         isPlay = true;
         play();
      }
      else if(_level0.P1_role.isKO || _level0.P2_role.isKO || _level0.KO && _level0.P1_role.status_3 != "attack" && _level0.P2_role.status_3 != "attack")
      {
         type = "win";
         isPlay = true;
         play();
      }
   }
   else if((_level0.winner.status_2 == "land" || _level0.winner.status_2 == "toLand") && _level0.winner.status_3 == "normal" || _level0.KO && _level0.P1_role.status_3 != "attack" && _level0.P2_role.status_3 != "attack")
   {
      type = "win";
      isPlay = true;
      play();
   }
   else if(_level0.P1_role.isKO && _level0.P2_role.isKO)
   {
      type = "draw";
      isPlay = true;
      play();
   }
   else if(_level0.winner.status_1 == "walk_f" || _level0.winner.status_1 == "dash_f" || _level0.KO && _level0.P1_role.status_3 != "attack" && _level0.P2_role.status_3 != "attack")
   {
      type = "win";
      isPlay = true;
      play();
   }
};
setTimeout(function()
{
   if(isPlay == false)
   {
      if(_level0.P1_role.life == _level0.P2_role.life)
      {
         type = "draw";
      }
      else if(_level0.P1_role.isKO || _level0.P2_role.isKO)
      {
         type = "win";
      }
      if(_level0.P1_role.life != _level0.P2_role.life)
      {
         type = "win";
      }
      play();
   }
}
,20000);

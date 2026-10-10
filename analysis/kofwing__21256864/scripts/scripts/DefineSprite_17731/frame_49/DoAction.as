if(role.dir > 0 && role._x + _level0.char_mc._x > _level0.stage_with - 150 || role.dir < 0 && role._x + _level0.char_mc._x < 150)
{
   delete this.onEnterFrame;
   gotoAndStop("att");
   play();
}
else if(role.dir > 0 && role._x + _level0.char_mc._x > _level0.egde_max - 150 || role.dir < 0 && role._x + _level0.char_mc._x < _level0.egde_min + 150)
{
   delete this.onEnterFrame;
   gotoAndStop("att");
   play();
}
else
{
   gotoAndStop("drag");
   play();
}

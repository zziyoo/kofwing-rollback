_parent.opp.mc.catched = true;
_parent.opp.mc.hitSkillName = "sk_dongjie";
_parent.opp.checkTouch_stop = true;
_parent.checkTouch_stop = true;
_parent.opp.stop_hurtBack();
this.onEnterFrame = function()
{
   if(_level0.inPause)
   {
      return undefined;
   }
   _parent.opp.mc.stop();
};
_opp._y = 445;

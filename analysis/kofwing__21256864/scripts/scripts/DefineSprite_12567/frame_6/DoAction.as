_parent.wireAttack = true;
this.onEnterFrame = function()
{
   if(- level0.inPause || _level0.inFreeze)
   {
      return undefined;
   }
   if(_parent.opp.status_7 == "neo" && (_parent.opp.status_1 == "hurt3" || _parent.opp.status_1 == "hurt_crash"))
   {
      _level0.zoomControl_mc.zoomIn(_level0.char_mc,_root.role_mc,1.4,0.25);
      delete this.onEnterFrame;
   }
};

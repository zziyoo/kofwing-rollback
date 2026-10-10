this._visible = false;
this.onEnterFrame = function()
{
   if(_level0.inPause)
   {
      return undefined;
   }
   if(_root.role_mc.onHit)
   {
      this._visible = true;
      delete this.onEnterFrame;
   }
   else if(_root.role_mc.opp.onHit)
   {
      this._visible = true;
      delete this.onEnterFrame;
   }
};

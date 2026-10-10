stop();
this.onEnterFrame = function()
{
   this._y = _root.role_mc._y - 144;
   if(_root.role_mc.dir == 1)
   {
      this._x = _root.role_mc._x + 180;
   }
   else
   {
      this._x = _root.role_mc._x - 180;
   }
   if(_root.role_mc.status_3 == "hurt" || _root.role_mc.status_3 == "down")
   {
      delete this.onEnterFrame;
      gotoAndPlay(6);
   }
   if(_level0.inPause)
   {
      return undefined;
   }
   var _loc4_ = _root.role_mc.getObjs();
   var _loc3_ = 0;
   while(_loc3_ < _loc4_.length)
   {
      if(this.hitTest(_loc4_[_loc3_].area) && _loc4_[_loc3_].objName != "Rugal_shanzi100")
      {
         delete this.onEnterFrame;
         gotoAndStop("shoot");
         play();
      }
      _loc3_ = _loc3_ + 1;
   }
};

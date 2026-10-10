var time = 0;
var role = _root.role_mc;
this.onEnterFrame = function()
{
   if(_level0.inPause || _level0.inFreeze)
   {
      return undefined;
   }
   time++;
   if(time > 300)
   {
      this.removeMovieClip();
   }
   if(role.status_3 != "hurt" && role.status_3 != "down" && role.status_3 != "")
   {
      if(Key.isDown(role.f) && this._x < 843 - _level0.char_mc._x)
      {
         this._x += 25;
      }
      if(Key.isDown(role.u) && this._y >= 0)
      {
         this._y -= 25;
      }
      if(Key.isDown(role.b) && this._x > 20 - _level0.char_mc._x)
      {
         this._x -= 25;
      }
      if(Key.isDown(role.d) && this._y <= 415)
      {
         this._y += 25;
      }
   }
};

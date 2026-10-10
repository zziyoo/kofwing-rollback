stop();
if(_level0.debug == true)
{
   _visible = true;
}
else
{
   _visible = false;
}
var pt = new Object();
pt.x = this._x;
pt.y = this._y;
_parent.localToGlobal(pt);
var i = 0;
var num = 0;
var dx = 0;
var dy = 0;
var posx = pt.x;
var posy = pt.y;
var dir = _root.role_mc.dir;
var px = posx - _level0.char_mc._x;
_root.role_mc.addSkill(name,this,px,py);
num++;
this.onEnterFrame = function()
{
   if(_level0.inPause)
   {
      return undefined;
   }
   if(_level0.inFreeze)
   {
      return undefined;
   }
   i++;
   if(i == intvalFrame)
   {
      i = 0;
      posx += intvalDisX * dir;
      posy += intvalDisY;
      px = posx - _level0.char_mc._x;
      if(num == numMax)
      {
         if(lastObj != "")
         {
            name = lastObj;
         }
         _root.role_mc.addSkill(name,this,px,py);
         delete this.onEnterFrame;
         delete _parent.color_mc.onEnterFrame;
         if(_root.role_mc.opp.status_3 != "hurt")
         {
            _parent.removeMovieClip();
         }
      }
      else if(posx > _level0.stage_with + 100 || posx < -100)
      {
         delete this.onEnterFrame;
         delete _parent.color_mc.onEnterFrame;
         if(_root.role_mc.opp.status_3 != "hurt")
         {
            _parent.removeMovieClip();
         }
      }
      else
      {
         _root.role_mc.addSkill(name,this,px,py);
      }
   }
};

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
_root.role_mc.addSkill(name,this,Vx,Va,false,shadowTime,sAlpha,_add);
if(shadowTime > 0)
{
   var i = 0;
   onEnterFrame = function()
   {
      if(_root.role_mc.inFreeze)
      {
         return undefined;
      }
      i++;
      var _loc3_;
      if(i == add_interval)
      {
         i = 0;
         _loc3_ = sAlpha * shadowTime;
         _root.role_mc.addSkill(name,this,Vx,Va,true,shadowTime,_loc3_,_add);
         shadowTime--;
      }
      if(shadowTime == 0)
      {
         delete this.onEnterFrame;
      }
   };
}

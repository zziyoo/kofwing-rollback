stop();
if(_level0.debug == true)
{
   _visible = true;
}
else
{
   _visible = false;
}
role = _root.role_mc;
trace("role::::::::::::" + role);
if(jumpFar && _root.role_mc.Vx != _root.role_mc.Vjump_far * 1.15 * _root.role_mc.dir)
{
   return undefined;
}
role.addShadow(shadow_name,this,start_alpha,end_alpha,d_alpha,_rb,_gb,_bb);
if(add_interval > 0)
{
   var i = 0;
   onEnterFrame = function()
   {
      if(role.inFreeze || _level0.inPause)
      {
         return undefined;
      }
      i++;
      if(i == add_interval)
      {
         i = 0;
         role.addShadow(shadow_name,this,start_alpha,end_alpha,d_alpha,_rb,_gb,_bb);
      }
   };
}

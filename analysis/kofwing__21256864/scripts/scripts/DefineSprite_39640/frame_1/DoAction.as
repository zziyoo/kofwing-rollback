stop();
if(_level0.debug == true)
{
   _visible = true;
}
else
{
   _visible = false;
}
if(!XIIIopen && _level0.XIIIeff)
{
   return undefined;
}
role = _root.role_mc;
role.addShadow_obj(shadow_name,this,start_alpha,end_alpha,d_alpha,_rb,_gb,_bb);
if(add_interval > 0)
{
   var i = 0;
   onEnterFrame = function()
   {
      if(_level0.inPause)
      {
         return undefined;
      }
      if(role.inFreeze)
      {
         return undefined;
      }
      i++;
      if(i == add_interval)
      {
         i = 0;
         role.addShadow_obj(shadow_name,this,start_alpha,end_alpha,d_alpha,_rb,_gb,_bb);
      }
   };
}

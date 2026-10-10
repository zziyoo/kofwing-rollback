stop();
if(_level0.debug == true)
{
   _visible = true;
}
else
{
   _visible = false;
}
_posObj = eval(posObj);
role = _root.role_mc;
var hit;
hit = role.catch_oppPos2(this,_posObj,status_1,flag,land,hurt,downHit);
if(hit && back)
{
   if(role.dir == 1)
   {
      role.opp.chageSide1();
   }
   else
   {
      role.opp.chageSide2();
   }
}
if(hit)
{
   _parent[func]();
}
else
{
   onEnterFrame = function()
   {
      if(_level0.inPause)
      {
         return undefined;
      }
      hit = role.catch_oppPos2(this,_posObj,status_1,flag,land,hurt,downHit);
      if(hit && back)
      {
         if(role.dir == 1)
         {
            role.opp.chageSide1();
         }
         else
         {
            role.opp.chageSide2();
         }
      }
      if(hit)
      {
         delete this.onEnterFrame;
         _parent[func]();
      }
   };
}

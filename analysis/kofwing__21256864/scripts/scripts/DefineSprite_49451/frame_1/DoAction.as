stop();
this._visible = false;
_posObj = eval(posObj);
role = _root.role_mc;
var hit;
hit = role.catch_oppPos2(this,_posObj,status_1,flag,land,hurt,downHit,oppDirChange);
if(hit)
{
   _parent[func]();
}
onEnterFrame = function()
{
   if(_level0.inPause)
   {
      return undefined;
   }
   hit = role.catch_oppPos2(this,_posObj,status_1,flag,land,hurt,downHit,oppDirChange);
   if(hit)
   {
      _parent[func]();
   }
};

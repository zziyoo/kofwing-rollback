if(_level0.debug == true)
{
   _visible = true;
}
else
{
   _visible = false;
}
role = _root.role_mc;
_posObj = eval(targetMc);
this.onEnterFrame = function()
{
   if(_level0.inPause)
   {
      return undefined;
   }
   if(role.inFreeze)
   {
      return undefined;
   }
   role.objStartMoveX1(Vx,_posObj);
};

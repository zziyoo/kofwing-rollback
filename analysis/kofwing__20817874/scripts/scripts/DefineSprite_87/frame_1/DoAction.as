_root.debug = false;
this._visible = false;
var flag = true;
onEnterFrame = function()
{
   if(_root.P1_role.hits == 0 && _root.P2_role.status_3 != "hurt")
   {
      _root.P2_role.hurtPrev = _root.P2_role.status_1;
   }
   if(_root.P2_role.hits == 0 && _root.P1_role.status_3 != "hurt")
   {
      _root.P1_role.hurtPrev = _root.P1_role.status_1;
   }
   _root.P1_role.clearLists();
   _root.P2_role.clearLists();
   if(!this._visible)
   {
      return undefined;
   }
};

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
var roleName = _root.role_mc.roleName;
var typpe = "1";
if(!roles)
{
   type = _root.role_mc.opp.roleMode;
   roleName = _root.role_mc.opp.objRoleName;
}
else
{
   type = _root.role_mc.roleMode;
}
type = type.trim();
if(type == 2)
{
   if(roleName = "Mizuchi")
   {
      _root.role_mc.opp.addSkill_opp("roleMizuchi",this,Vx,Va);
   }
   else if(roleName == "Zero" || roleName == "Athena" || roleName == "Krizalid" || roleName == "KyoW")
   {
      _root.role_mc.opp.addSkill_opp("role" + roleName + "2",this,Vx,Va);
   }
   else
   {
      _root.role_mc.opp.addSkill_opp("role" + roleName,this,Vx,Va);
   }
}
else if(type == 3)
{
   _root.role_mc.opp.addSkill_opp("role" + roleName + "3",this,Vx,Va);
}
else if(objRoleName == "Goenitz")
{
   _root.role_mc.opp.addSkill_opp("role" + roleName + "2",this,Vx,Va);
}
else
{
   _root.role_mc.opp.addSkill_opp("role" + roleName,this,Vx,Va);
}
this.onEnterFrame = function()
{
   var _loc3_ = _root.role_mc.opp.getObjs();
   var _loc2_ = 0;
   while(_loc2_ < _loc3_.length)
   {
      if(_loc3_[_loc2_].isRole = true || _loc3_[_loc2_].objRoleName != undefined)
      {
         _loc3_[_loc2_].gotoAndStop(status_1);
         _loc3_[_loc2_].mc.gotoAndStop(frame);
      }
      _loc2_ = _loc2_ + 1;
   }
   if(targetRole == "opp")
   {
      _loc3_ = _root.role_mc.opp.getObjs();
      _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         if(_loc3_[_loc2_].isRole = true)
         {
            _loc3_[_loc2_]._x = _root.role_mc.opp._x;
            _loc3_[_loc2_]._y = _root.role_mc.opp._y;
            _loc3_[_loc2_]._xscale *= -1;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   if(targetRole == "this")
   {
      _loc3_ = _root.role_mc.opp.getObjs();
      _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         if(_loc3_[_loc2_].isRole = true)
         {
            _loc3_[_loc2_]._x = _root.role_mc._x;
            _loc3_[_loc2_]._y = _root.role_mc._y;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
};

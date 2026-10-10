stop();
this._visible = false;
role = _root.role_mc;
this.onEnterFrame = function()
{
   if(_level0.inPause)
   {
      return undefined;
   }
   if(role.inBurst == true)
   {
      if(role.burst_mode == "defend")
      {
         role.armor_mode = true;
      }
      if(role.burst_mode == "attack")
      {
         role.att_mode = true;
      }
      if(role.burst_mode == "power")
      {
         role.power_mode = true;
      }
      role.powerObj.action = "burstdec";
      role.powerObj.decNum = 0.1;
      role.powerControl(role.powerObj);
   }
   else
   {
      role.armor_mode = false;
      role.att_mode = false;
      role.power_mode = false;
   }
};

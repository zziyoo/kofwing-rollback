powerCost = 0;
powerLevel = 0;
powerNeed = 100;
this.onEnterFrame = function()
{
   if(_level0.inPause || _level0.inFreeze)
   {
      return undefined;
   }
   if(powerLevel >= 4)
   {
      return undefined;
   }
   if(role.inBurst)
   {
      powerNeed = 80;
      role.powerObj.action = "burstdec";
      role.powerObj.decNum = 2;
      role.powerControl(role.powerObj);
      powerCost += 2;
   }
   else if(role == _level0.P1_role)
   {
      if(_level0.checkPowerNoLimit(role))
      {
         powerCost += 2;
      }
      else if(_level0.LP_P1.powerPoint_num == _level0.LP_P1.powerPoint_max)
      {
         _level0.LP_P1.powerPoint_num--;
         _level0.LP_P1.point_dec();
         _level0.LP_P1.power_now = _level0.LP_P1.power_max;
         powerCost += 2;
      }
      else if(_level0.LP_P1.power_now > 0)
      {
         _level0.LP_P1.power_now -= 2;
         _level0.LP_P1.power_length = _level0.LP_P1.power_now / _level0.LP_P1.power_max * _level0.LP_P1.powerBar_length;
         _level0.LP_P1.power_mc._width = _level0.LP_P1.power_length;
         powerCost += 2;
         if(_level0.LP_P1.power_now <= 0 && _level0.LP_P1.powerPoint_num > 0)
         {
            _level0.LP_P1.powerPoint_num--;
            _level0.LP_P1.power_now = _level0.LP_P1.power_max;
            _level0.LP_P1.point_dec();
         }
      }
      else if(_level0.LP_P1.powerPoint_num > 0)
      {
         _level0.LP_P1.powerPoint_num--;
         _level0.LP_P1.power_now = _level0.LP_P1.power_max;
         _level0.LP_P1.point_dec();
         powerCost += 2;
      }
   }
   else if(role == _level0.P2_role)
   {
      if(_level0.checkPowerNoLimit(role))
      {
         powerCost += 2;
      }
      else if(_level0.LP_P2.powerPoint_num == _level0.LP_P2.powerPoint_max)
      {
         _level0.LP_P2.powerPoint_num--;
         _level0.LP_P2.point_dec();
         _level0.LP_P2.power_now = _level0.LP_P2.power_max;
         powerCost += 2;
      }
      else if(_level0.LP_P2.power_now > 0)
      {
         _level0.LP_P2.power_now -= 2;
         _level0.LP_P2.power_length = _level0.LP_P2.power_now / _level0.LP_P2.power_max * _level0.LP_P2.powerBar_length;
         _level0.LP_P2.power_mc._width = _level0.LP_P2.power_length;
         powerCost += 2;
         if(_level0.LP_P2.power_now <= 0 && _level0.LP_P2.powerPoint_num > 0)
         {
            _level0.LP_P2.powerPoint_num--;
            _level0.LP_P2.power_now = _level0.LP_P2.power_max;
            _level0.LP_P2.point_dec();
         }
      }
      else if(_level0.LP_P2.powerPoint_num > 0)
      {
         _level0.LP_P2.powerPoint_num--;
         _level0.LP_P2.power_now = _level0.LP_P2.power_max;
         _level0.LP_P2.point_dec();
         powerCost += 2;
      }
   }
   if(powerCost >= powerNeed)
   {
      powerLevel++;
      powerCost -= powerNeed;
   }
};

function coverSkill(role)
{
   role.newKeyControl.toAction_interval = 10;
   role.newKeyControl.Interval_toAction = 0;
   role.newKeyControl.toAction = function(action)
   {
      clearInterval(this.Interval_toAction);
      role.toAction(action);
   };
   role.newKeyControl.actionCheck = function(myKey)
   {
      var _loc2_;
      if(myKey == this.f)
      {
         if(this.dir == 1)
         {
            _loc2_ = "walk_f";
         }
         else
         {
            _loc2_ = "walk_b";
         }
      }
      else if(myKey == this.b)
      {
         if(this.dir == 1)
         {
            _loc2_ = "walk_b";
         }
         else
         {
            _loc2_ = "walk_f";
         }
      }
      else if(myKey == this.u)
      {
         _loc2_ = "jump";
      }
      else if(myKey == this.d)
      {
         _loc2_ = "squat";
      }
      clearInterval(this.Interval_toAction);
      this.Interval_toAction = setInterval(this,"toAction",this.toAction_interval,_loc2_);
   };
   role.newKeyControl.keyChain_dir = function(key)
   {
      var _loc2_ = key;
      if(this.dir == -1)
      {
         if(_loc2_ == this.f)
         {
            _loc2_ = this.b;
         }
         else if(_loc2_ == this.b)
         {
            _loc2_ = this.f;
         }
      }
      var _loc4_;
      var _loc3_;
      if(this.time_check == 0)
      {
         this.input_array.push(_loc2_);
         this.time_check = getTimer();
      }
      else
      {
         _loc4_ = this.time_check;
         _loc3_ = getTimer();
         this.time_check = _loc3_;
         if(_loc3_ - _loc4_ < this.time_interval && _loc3_ - _loc4_ > this.time_interval3)
         {
            this.input_array.push(_loc2_);
            if(this.input_array[this.input_array.length - 2] == _loc2_)
            {
               clearInterval(this.Interval_toAction);
               this.Interval_toAction = setInterval(this,"doubleKey",this.toAction_interval,_loc2_);
            }
         }
         else
         {
            this.keyClear();
            this.time_check = 0;
            this.keyChain_dir(key);
         }
      }
      if(this.input_array.length > 6)
      {
         this.input_array.shift();
      }
   };
   role.newKeyControl.doubleKey = function(myKey)
   {
      clearInterval(this.Interval_toAction);
      if(myKey == this.f)
      {
         this.role._to_double_f();
      }
      else if(myKey == this.b)
      {
         this.role._to_double_b();
      }
      else if(myKey == this.d)
      {
         this.role._to_double_d();
      }
   };
   role.power_skillBurst = 150;
   role.superCheck = function(action)
   {
      this.superSkill = false;
      if(this.superList[action] == 1)
      {
         if(this.superPoint > 0)
         {
            this.superSkill = true;
            this.powerDecType = "super";
            return true;
         }
         if(this.inBurst)
         {
            this.superSkill = true;
            this.powerDecType = "super";
            return true;
         }
         return false;
      }
      return "notSuperSkill";
   };
}
stop();
coverSkill(P1_role);
coverSkill(P2_role);

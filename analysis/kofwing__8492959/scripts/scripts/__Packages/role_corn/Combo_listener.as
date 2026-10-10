class role_corn.Combo_listener extends MovieClip
{
   var beCancled;
   var combo1;
   var combo2;
   var combo22;
   var noCancle;
   var notTOcancle;
   var onEnterFrame;
   var role;
   var s_cancle;
   var skill_o;
   var skill_o2;
   var superCancle;
   function Combo_listener()
   {
      super();
   }
   function check_combo(status_1, skill)
   {
      this.superCancle = false;
      if(status_1 == "powercd")
      {
         return undefined;
      }
      if(this.noCancle[status_1] == skill)
      {
         return undefined;
      }
      if(this.check_combo1(status_1,skill))
      {
         return true;
      }
      if(this.check_combo2(status_1,skill))
      {
         return true;
      }
      if(this.check_combo3(status_1,skill))
      {
         return true;
      }
      if(this.check_combo4(status_1,skill))
      {
         return true;
      }
   }
   function check_combo1(status_1, skill)
   {
      var _loc2_;
      _loc2_ = this.combo1[status_1][skill];
      if(_loc2_ != undefined)
      {
         if(this.start_combo(status_1,_loc2_))
         {
            return true;
         }
      }
   }
   function check_combo2(status_1, skill)
   {
      var _loc4_ = this.role;
      var _loc5_ = this.role.mc;
      if(this.beCancled[status_1] != 1)
      {
         return false;
      }
      if(!(this.s_cancle[status_1][skill] == 1 || this.s_cancle[status_1][skill] == true))
      {
         if(this.notTOcancle[skill] == 1)
         {
            return false;
         }
      }
      if(this.start_combo(status_1,skill))
      {
         return true;
      }
   }
   function check_combo3(status_1, skill)
   {
      if(this.role.superCancle() && this.notTOcancle[skill] != 1 && status_1 != skill)
      {
         this.superCancle = true;
         if(this.start_combo(status_1,skill))
         {
            return true;
         }
      }
   }
   function check_combo4(status_1, skill)
   {
      if(this.role.superCancle() && this.notTOcancle[skill] != 1 && status_1 != skill)
      {
         this.superCancle = true;
         if(this.role.status_2 == "toLand")
         {
            this.role.status_2 = "land";
            this.role.powerDecType2 = "cancle";
            this.role.skill_start(skill);
            return true;
         }
      }
   }
   function start_combo(status_1, skill)
   {
      var role_mc = this.role;
      var _loc3_ = this.role.mc;
      var start_frame = this.combo2[status_1];
      var end_frame = this.skill_o[status_1];
      var start_frame2 = this.combo22[status_1];
      var end_frame2 = this.skill_o2[status_1];
      if(isNaN(start_frame))
      {
         return false;
      }
      var SC = this.superCancle;
      if(_loc3_._currentframe < start_frame - 5)
      {
         return false;
      }
      _loc3_.onEnterFrame = function()
      {
         if(_level0.inPause)
         {
            return undefined;
         }
         if(role_mc.inFreeze)
         {
            return undefined;
         }
         if(start_frame < end_frame)
         {
            if(this._currentframe >= start_frame && this._currentframe <= end_frame)
            {
               if(SC)
               {
                  role_mc.powerDecType2 = "cancle";
               }
               role_mc.skill_start(skill);
               if(isNaN(start_frame2))
               {
                  delete this.onEnterFrame;
               }
            }
         }
         else if(this._currentframe >= start_frame)
         {
            if(SC)
            {
               role_mc.powerDecType2 = "cancle";
            }
            role_mc.skill_start(skill);
            delete this.onEnterFrame;
         }
         if(!isNaN(start_frame2))
         {
            if(start_frame2 < end_frame2)
            {
               if(this._currentframe >= start_frame2 && this._currentframe <= end_frame2)
               {
                  if(SC)
                  {
                     role_mc.powerDecType2 = "cancle";
                  }
                  role_mc.skill_start(skill);
                  delete this.onEnterFrame;
               }
            }
            else if(this._currentframe >= start_frame2)
            {
               if(SC)
               {
                  role_mc.powerDecType2 = "cancle";
               }
               role_mc.skill_start(skill);
               delete this.onEnterFrame;
            }
         }
      };
      return true;
   }
}

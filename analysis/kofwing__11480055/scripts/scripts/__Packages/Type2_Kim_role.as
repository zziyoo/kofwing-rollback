class Type2_Kim_role extends Kim_role
{
   var b;
   var begin2;
   var burstList;
   var burst_mode;
   var checkSide_abs;
   var d;
   var dir;
   var f;
   var gotoAndStop;
   var inBurst;
   var jumpSkill;
   var kick_l;
   var mode_key;
   var normalList2;
   var pitch;
   var roleMode;
   var skillObj;
   var skillSuperMapping;
   var status_1;
   var status_2;
   var status_3;
   var superList;
   var superMaxList;
   var switchSkill;
   var toSkill;
   var toStatus_switch;
   function Type2_Kim_role()
   {
      super();
      this.roleMode = 2;
      this.superList = {sk_s_120:1,sk_s_120_l:1,sk32:1,sk32_air:1};
      this.burstList = {sk_02ummax2:1,sk36:1,sk34:1};
      this.superMaxList = {sk_s_120_s:1,sk_s_120_l_s:1,sk32_s:1,sk32_s_air:1};
      this.skillSuperMapping = {sk_s_120:"sk_s_120_s",sk_s_120_l:"sk_s_120_l_s",sk32:"sk32_s",sk32_s:"sk32_s_air"};
      this.normalList2 = ["kick3","kick4","dash_pl","dash_pl2"];
      this.begin2();
      this.skillObj.s1 = "sk_s_120";
      this.skillObj.s2 = "sk32";
      this.skillObj.busrt_a = "sk_02ummax2";
      this.skillObj.busrt_d = "sk36";
   }
   function kick3()
   {
      if(this.status_2 == "air" && this.mode_key == "easy")
      {
         if(this.status_1 == "sk32" || this.status_1 == "sk32_air" || this.status_1 == "sk32_s" || this.status_1 == "sk32_s_air")
         {
            return false;
         }
         this.toSkill("sk32");
         if(this.inBurst == true && this.burst_mode == "power")
         {
            this.sk32_s();
         }
         else if(this.inBurst == true || this == _level0.P1_role && _level0.LP_P1.powerPoint_num > 0 || this == _level0.P2_role && _level0.LP_P2.powerPoint_num > 0)
         {
            this.sk32();
         }
      }
      else if(this.status_2 == "air")
      {
         this.kick_l();
      }
      else
      {
         if(this.status_2 != "land")
         {
            return undefined;
         }
         if(this.status_3 == "attack")
         {
            this.status_1 = "kick4";
         }
         else
         {
            this.status_1 = "kick3";
         }
         this.status_3 = "attack";
         this.gotoAndStop(this.status_1);
      }
   }
   function sk32_fake()
   {
      if(this.status_1 == "sk32" || this.status_1 == "sk32_air")
      {
         return false;
      }
      if(!this.inBurst)
      {
         if(this == _level0.P1_role && _level0.LP_P1.powerPoint_num < 1 || this == _level0.P2_role && _level0.LP_P2.powerPoint_num < 1)
         {
            if(this.status_1 == "sk1")
            {
               this.toStatus_switch("stand");
               return false;
            }
            return false;
         }
         this.switchSkill("sk32");
      }
      else if(this.inBurst)
      {
         this.switchSkill("sk32");
      }
   }
   function sk32()
   {
      if(this.status_1 == "sk32" || this.status_1 == "sk32_air")
      {
         return false;
      }
      if(this.status_2 == "land")
      {
         this.status_1 = "sk32";
         this.status_3 = "attack";
         this.gotoAndStop(this.status_1);
      }
      else if(this.status_2 == "air")
      {
         this.checkSide_abs();
         this.status_1 = "sk32_air";
         this.status_3 = "attack";
         this.gotoAndStop(this.status_1);
      }
   }
   function sk32_s()
   {
      if(this.status_1 == "sk32_s" || this.status_1 == "sk32_s_air")
      {
         return false;
      }
      if(this.status_2 == "land")
      {
         this.status_1 = "sk32_s";
         this.status_3 = "attack";
         this.gotoAndStop(this.status_1);
      }
      else if(this.status_2 == "air")
      {
         this.checkSide_abs();
         this.status_1 = "sk32_s_air";
         this.status_3 = "attack";
         this.gotoAndStop(this.status_1);
      }
   }
   function to_kick()
   {
      var _loc2_;
      if(this.status_1 == "jump_f" || this.status_1 == "jump_far" || this.status_1 == "jump" || this.status_1 == "jump_b")
      {
         this.jumpSkill("kick");
         return undefined;
      }
      if(Key.isDown(this.d))
      {
         _loc2_ = "squatKick";
      }
      else if(Key.isDown(this.f) && this.dir == 1 || Key.isDown(this.b) && this.dir == -1)
      {
         if(this.pitch(true))
         {
            return undefined;
         }
         _loc2_ = "kick";
      }
      else
      {
         _loc2_ = "kick";
      }
      this.toSkill(_loc2_);
   }
   function to_kick_l()
   {
      var _loc2_;
      if(this.status_1 == "jump_f" || this.status_1 == "jump_far" || this.status_1 == "jump" || this.status_1 == "jump_b")
      {
         this.jumpSkill("kick_l");
         return undefined;
      }
      if(Key.isDown(this.d))
      {
         _loc2_ = "squatKick_l";
      }
      else if(Key.isDown(this.f) && this.dir == 1)
      {
         _loc2_ = "kick3";
      }
      else if(Key.isDown(this.b) && this.dir == -1)
      {
         _loc2_ = "kick3";
      }
      else if(this.mode_key == "easy")
      {
         _loc2_ = this.skillObj.s2;
      }
      else
      {
         _loc2_ = "kick_l";
      }
      this.toSkill(_loc2_);
   }
   function to_punch()
   {
      var _loc2_;
      if(this.status_1 == "jump_f" || this.status_1 == "jump_far" || this.status_1 == "jump" || this.status_1 == "jump_b")
      {
         this.jumpSkill("punch");
         return undefined;
      }
      if(Key.isDown(this.d))
      {
         _loc2_ = "squatPunch";
      }
      else if(this.status_1 == "dash_f")
      {
         _loc2_ = "punch";
      }
      else if(Key.isDown(this.f) && this.dir == 1 || Key.isDown(this.b) && this.dir == -1)
      {
         if(this.pitch())
         {
            return undefined;
         }
         _loc2_ = "punch";
      }
      else
      {
         _loc2_ = "punch";
      }
      this.toSkill(_loc2_);
   }
   function to_punch_l()
   {
      var _loc2_;
      if(this.status_1 == "jump_f" || this.status_1 == "jump_far" || this.status_1 == "jump" || this.status_1 == "jump_b")
      {
         this.jumpSkill("punch_l");
         return undefined;
      }
      if(this.status_1 == "dash_f")
      {
         _loc2_ = "dash_pl";
      }
      else if(Key.isDown(this.d))
      {
         _loc2_ = "squatPunch_l";
      }
      else if(this.mode_key == "easy")
      {
         _loc2_ = this.skillObj.s1;
      }
      else
      {
         _loc2_ = "punch_l";
      }
      this.toSkill(_loc2_);
   }
}

class Type2_Haohmaru_role extends Haohmaru_role
{
   var b;
   var begin2;
   var burstList;
   var d;
   var dir;
   var f;
   var gotoAndStop;
   var jumpSkill;
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
   var toSkill;
   function Type2_Haohmaru_role()
   {
      super();
      this.roleMode = 2;
      this.superList = {fdbf_p_EX:1,dfdf_k_EX:1};
      this.burstList = {df_o_EX:1,db_o_EX:1};
      this.superMaxList = {fdbf_p_EXmax:1,dfdf_k_EX_max:1};
      this.skillSuperMapping = {fdbf_p_EX:"fdbf_p_EXmax",dfdf_k_EX:"dfdf_k_EX_max"};
      this.normalList2 = ["f_pl_EX","f_pl_EX2","dash_pl","f_kl","dash_p","bd_k","dash_k","dash_kl"];
      this.begin2();
      this.skillObj.s1 = "fdbf_p_EX";
      this.skillObj.s2 = "dfdf_k_EX";
      this.skillObj.busrt_a = "db_o_EX";
      this.skillObj.busrt_d = "df_o_EX";
      this.skillObj.toAir = "fdf_kl";
   }
   function kick_l_paisheng()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_3 = "attack";
      this.gotoAndStop("kick_l");
      this.status_1 = "kick_l_paisheng";
   }
   function punch2_paisheng()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_3 = "attack";
      this.gotoAndStop("punch2");
      this.status_1 = "punch2_paisheng";
   }
   function f_pl_EX_ai()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_3 = "attack";
      this.gotoAndStop("f_pl_EX");
      this.status_1 = "f_pl_EX_ai";
   }
   function f_pl_EX2_ai()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_3 = "attack";
      this.gotoAndStop("f_pl_EX2");
      this.status_1 = "f_pl_EX2_ai";
   }
   function kick_l_paisheng2()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_3 = "attack";
      this.gotoAndStop("kick_l");
      this.status_1 = "kick_l_paisheng2";
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
         _loc2_ = "dash_p";
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
      if(Key.isDown(this.d))
      {
         _loc2_ = "squatPunch_l";
      }
      else if(this.status_1 == "dash_f")
      {
         _loc2_ = "dash_pl";
      }
      else if(Key.isDown(this.f) && this.dir == 1 && this.status_1 != "punch")
      {
         if(this.status_3 == "attack")
         {
            _loc2_ = "f_pl_EX2";
         }
         else
         {
            _loc2_ = "f_pl_EX";
         }
      }
      else if(Key.isDown(this.b) && this.dir == -1 && this.status_1 != "punch")
      {
         if(this.status_3 == "attack")
         {
            _loc2_ = "f_pl_EX2";
         }
         else
         {
            _loc2_ = "f_pl_EX";
         }
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

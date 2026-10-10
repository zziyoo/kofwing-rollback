class Oswald_role extends role_corn.Role
{
   var Vdash;
   var Vjump_far;
   var Vjump_x;
   var Vjump_y;
   var Vwalk;
   var _roleName;
   var _to_PK;
   var b;
   var begin;
   var begin2;
   var begin3;
   var burstList;
   var check_hold_d;
   var colorObj;
   var comboClass;
   var control2;
   var d;
   var delaySkill;
   var dir;
   var effect_loader;
   var f;
   var farJumpT;
   var farJumpT2;
   var getObjs;
   var gotoAndStop;
   var holdFreeze;
   var hold_d;
   var input_pre;
   var jumpSkill;
   var mc;
   var mode_key;
   var move_squat;
   var nonSkill;
   var normalList;
   var normalList2;
   var opp;
   var opp_hight;
   var opp_hight2;
   var opp_width2;
   var pitch;
   var run_snd;
   var scale;
   var skillObj;
   var skillSuperMapping;
   var skill_delay;
   var skill_loader;
   var skill_mc;
   var stage_with;
   var status_1;
   var status_2;
   var status_3;
   var status_4;
   var status_6;
   var status_7;
   var status_end;
   var superList;
   var superMaxList;
   var toSkill;
   var winPoseArray;
   var wireAttack;
   function Oswald_role()
   {
      super();
      this._roleName = "Oswald";
      this.scale = 100;
      this.Vwalk = 11;
      this.Vdash = 29;
      this.Vjump_x = 12;
      this.Vjump_y = 39;
      this.Vjump_far = 18;
      this.opp_width2 = 60;
      this.superList = {sk_s1:1,sk_s2:1,sk_s2_l:1};
      this.burstList = {sk_max2:1,sk_max3:1};
      this.superMaxList = {sk_s1_s:1,sk_s2_s:1};
      this.skillSuperMapping = {sk_s1:"sk_s1_s",sk_s2:"sk_s2_s",sk_s2_l:"sk_s2_s"};
      this.normalList2 = ["ten","ten2","J","J2"];
      this.winPoseArray = ["end","end2","end3"];
      var _loc3_ = Math.random();
      if(_loc3_ > 0.66)
      {
         this.begin();
      }
      else if(_loc3_ > 0.33)
      {
         this.begin2();
      }
      else
      {
         this.begin3();
      }
      this.skillObj.s1 = "sk_s2";
      this.skillObj.s2 = "sk_s1";
      this.skillObj.busrt_a = "sk_max2";
      this.skillObj.busrt_d = "sk_max3";
      this.skillObj.toAir = "fang_l";
      this.skillObj.heavyHit = "heavyHit";
      this.comboClass = new Oswald_Combo(this);
      this.preCheck();
      this.colorObj.fire_red1 = {ra:"100",rb:"255",ga:"80",gb:"110",ba:"-100",bb:"0",aa:"100",ab:"0"};
      this.colorObj.fire_red2 = {ra:"80",rb:"255",ga:"-80",gb:"255",ba:"-100",bb:"0",aa:"100",ab:"0"};
      this.colorObj.fire_blue2 = {ra:"100",rb:"0",ga:"100",gb:"0",ba:"100",bb:"255",aa:"100",ab:"0"};
      this.colorObj.fire_blue1 = {ra:"-100",rb:"178",ga:"-100",gb:"96",ba:"-100",bb:"239",aa:"100",ab:"0"};
      this.colorObj.ice1 = {ra:"-100",rb:"255",ga:"-50",gb:"255",ba:"100",bb:"255",aa:"100",ab:"0"};
      this.colorObj.purple1 = {ra:"-16",rb:"139",ga:"-21",gb:"97",ba:"-11",bb:"170",aa:"100",ab:"0"};
      this.colorObj.purple2 = {ra:"2",rb:"129",ga:"-24",gb:"110",ba:"-5",bb:"140",aa:"100",ab:"0"};
   }
   function preCheck()
   {
      this.input_pre.roll_f = 10;
      this.input_pre.roll_b = 10;
      this.input_pre.land = 0;
      this.input_pre.land2 = 0;
      this.input_pre.mei = 18;
      this.input_pre.mei2 = 18;
      this.input_pre.mei3 = 18;
      this.input_pre.mei_l = 13;
      this.input_pre.mei2_l = 13;
      this.input_pre.mei3_l = 13;
   }
   function squat()
   {
      this.farJumpT2 = 10;
      clearInterval(this.farJumpT);
      this.farJumpT = setInterval(this,"farJumpTimer",10);
      if(this.status_2 != "land" || this.status_3 != "normal" || this.holdFreeze || this.status_6 != "normal")
      {
         return false;
      }
      if(this.check_hold_d())
      {
         return undefined;
      }
      if(Key.isDown(this.b) && (this.opp.status_3 == "attack" && this.opp.status_6 == "normal" || this.opp.hasObj()) && (this.opp.status_1 != "pitch" || this.opp.status_1 != "pitch2"))
      {
         this.hold_d;
         return undefined;
      }
      if(this.status_7 != "squatt")
      {
         this.gotoAndStop("toSquat");
      }
      else
      {
         this.gotoAndStop("squat");
      }
      this.status_end = "toStand";
      this.opp_hight2 = this.opp_hight - 40;
      this.status_4 = "normal";
      this.move_squat();
      this.status_1 = "squat";
   }
   function toStatus(_action)
   {
      var _loc2_ = _action;
      this.wireAttack = false;
      if(this == _level0.P1_role && _level0.actionSet_status_P1 == "control" || this == _level0.P2_role && _level0.actionSet_status_P2 == "control")
      {
         this.control2 = true;
      }
      else
      {
         this.control2 = false;
      }
      if(_level0.inPause)
      {
         return false;
      }
      if(this.nonSkill && this.normalList.join().indexOf(_loc2_) == -1 && this.normalList2.join().indexOf(_loc2_) == -1)
      {
         return false;
      }
      if(_level0.inFreeze)
      {
         this.skill_delay(_loc2_);
         this.mc.stop();
         return false;
      }
      if(this[_loc2_] != undefined)
      {
         if(this[_loc2_]() == false)
         {
            return false;
         }
      }
      else
      {
         this.status_1 = _loc2_;
         this.gotoAndStop(_loc2_);
         if(this.status_1 == "toStand")
         {
            this.status_1 = "stand";
         }
      }
      this.run_snd.stop();
      return true;
   }
   function move_hold()
   {
      var f = this.f;
      var b = this.b;
      var d = this.d;
      var opp = this.opp;
      var dir = this.dir;
      var owner = this;
      this.mc.onEnterFrame = function()
      {
         if(_level0.inPause)
         {
            return undefined;
         }
         if(owner.inFreeze)
         {
            return undefined;
         }
         if(Key.isDown(f) && (opp.status_3 == "attack" && opp.status_6 == "normal" || opp.hasObj()) && (opp.status_1 != "pitch" || opp.status_1 != "pitch2") && dir == -1)
         {
            if(owner.status_1 == "hold_u" && Key.isDown(d))
            {
               owner.hold_d();
            }
            else if(owner.status_1 == "hold_d" && !Key.isDown(d))
            {
               owner.hold_u();
            }
         }
         else if(Key.isDown(b) && (opp.status_3 == "attack" && opp.status_6 == "normal" || opp.hasObj()) && (opp.status_1 != "pitch" || opp.status_1 != "pitch2") && dir == 1)
         {
            if(owner.status_1 == "hold_u" && Key.isDown(d))
            {
               owner.hold_d();
            }
            else if(owner.status_1 == "hold_d" && !Key.isDown(d))
            {
               owner.hold_u();
            }
         }
         else if(!owner.holdFreeze)
         {
            owner.status_3 = "normal";
            owner.status_6 = "normal";
            if(Key.isDown(d) && owner.status_1 == "hold_d")
            {
               owner.checkSide();
               owner.showHits_end();
               owner.status_7 = "squatt";
               owner.toStatus("squat");
            }
            else if(!Key.isDown(d) && owner.status_1 == "hold_d")
            {
               owner.checkSide();
               owner.showHits_end();
               owner.toStatus("toStand");
            }
            else
            {
               owner.toStatus_switch("stand");
            }
         }
      };
   }
   function addSkill_os(s_name, src, Vx, Va, dirs, isBlack, isGrey, isBack)
   {
      if(this.skill_mc && this.skill_mc.objName == s_name && this.skill_mc.allowNum == 1)
      {
         return undefined;
      }
      var _loc3_ = this.skill_loader.getNextHighestDepth();
      this.skill_mc = this.skill_loader.attachMovie(s_name,"skill" + _loc3_,_loc3_);
      this.skill_mc.objName = s_name;
      var _loc2_ = Func.lToG(src);
      this.skill_mc.isBack = isBack;
      if(_loc2_.x > this.stage_with)
      {
         _loc2_.x = this.stage_with;
      }
      else if(_loc2_.x < 0)
      {
         _loc2_.x = 0;
      }
      this.skill_loader.globalToLocal(_loc2_);
      this.skill_mc._x = _loc2_.x;
      this.skill_mc._y = _loc2_.y;
      if(dirs != undefined)
      {
         this.skill_mc.dir = dirs;
      }
      else
      {
         this.skill_mc.dir = this.dir;
      }
      this.skill_mc._xscale = this.skill_mc.dir * this.scale;
      this.skill_mc.role = this;
      this.skill_mc.opp = this.opp;
      this.skill_mc.action = this.status_1;
      this.skill_mc.init();
      this.skill_mc.dirs = this.skill_mc.dir;
      var _loc5_;
      var _loc6_;
      var _loc4_;
      if(isBlack)
      {
         _loc5_ = new Array(0.02,0.02,0.02,0.02,0.02,0.02,0.02,0.02,0.02,0.02,0.02,0.02,0.02,0.02,0.02,0.02,0,0,1,0);
         _loc6_ = new flash.filters.ColorMatrixFilter(_loc5_);
         _loc4_ = new Array();
         _loc4_.push(_loc6_);
         this.skill_mc.filters = _loc4_;
         this.skill_mc.isBlack = true;
      }
      if(isGrey)
      {
         _loc5_ = new Array(0.3,0.6,0.08,0,0,0.3,0.6,0.08,0,0,0.3,0.6,0.08,0,0,0,0,0,1,0);
         _loc6_ = new flash.filters.ColorMatrixFilter(_loc5_);
         _loc4_ = new Array();
         _loc4_.push(_loc6_);
         this.skill_mc.filters = _loc4_;
         this.skill_mc.blendMode = "subtract";
         this.skill_mc.isGrey = true;
      }
   }
   function addNonAtkEffect_os(e_name, src, e_x, e_y, dirs, isBlack, isGrey)
   {
      var _loc4_ = this.effect_loader.getNextHighestDepth();
      var _loc2_ = this.effect_loader.attachMovie(e_name,"effect" + _loc4_,_loc4_);
      var _loc3_ = Func.lToG(src);
      if(_loc3_.x > this.stage_with)
      {
         _loc3_.x = this.stage_with;
      }
      else if(_loc3_.x < 0)
      {
         _loc3_.x = 0;
      }
      this.effect_loader.globalToLocal(_loc3_);
      _loc2_._x = _loc3_.x;
      _loc2_._y = _loc3_.y;
      if(dirs != undefined)
      {
         _loc2_.dir = dirs;
      }
      else
      {
         _loc2_.dir = this.dir;
      }
      _loc2_._xscale = _loc2_.dir * this.scale;
      _loc2_.init();
      this.skill_mc.dirs = this.skill_mc.dir;
      var _loc6_;
      var _loc7_;
      var _loc5_;
      if(isBlack)
      {
         _loc6_ = new Array(0.02,0.02,0.02,0.02,0.02,0.02,0.02,0.02,0.02,0.02,0.02,0.02,0.02,0.02,0.02,0.02,0,0,1,0);
         _loc7_ = new flash.filters.ColorMatrixFilter(_loc6_);
         _loc5_ = new Array();
         _loc5_.push(_loc7_);
         _loc2_.filters = _loc5_;
      }
      if(isGrey)
      {
         _loc6_ = new Array(0.3,0.6,0.08,0,0,0.3,0.6,0.08,0,0,0.3,0.6,0.08,0,0,0,0,0,1,0);
         _loc7_ = new flash.filters.ColorMatrixFilter(_loc6_);
         _loc5_ = new Array();
         _loc5_.push(_loc7_);
         _loc2_.filters = _loc5_;
         _loc2_.blendMode = "subtract";
      }
   }
   function A()
   {
      this._to_PK();
      return false;
   }
   function sk_none()
   {
      return false;
   }
   function J()
   {
      if(this.status_2 != "land" || this.status_1 == "ten" || this.status_1 == "ten2")
      {
         return false;
      }
      this.status_1 = "J";
      this.status_3 = "attack";
      this.status_6 = "normal";
      this.gotoAndStop(this.status_1);
   }
   function J2()
   {
      if(this.status_2 != "land" || this.status_1 == "ten" || this.status_1 == "ten2")
      {
         return false;
      }
      this.status_1 = "J2";
      this.status_3 = "attack";
      this.status_6 = "normal";
      this.gotoAndStop(this.status_1);
   }
   function ten()
   {
      if(this.status_2 != "land" || this.status_1 == "J" || this.status_1 == "J2")
      {
         return false;
      }
      this.status_1 = "ten";
      this.status_3 = "attack";
      this.status_6 = "normal";
      this.gotoAndStop(this.status_1);
   }
   function ten2()
   {
      if(this.status_2 != "land" || this.status_1 == "J" || this.status_1 == "J2")
      {
         return false;
      }
      this.status_1 = "ten2";
      this.status_3 = "attack";
      this.status_6 = "normal";
      this.gotoAndStop(this.status_1);
   }
   function K()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_1 = "K";
      this.status_3 = "attack";
      this.status_6 = "normal";
      this.gotoAndStop(this.status_1);
   }
   function K_l()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_1 = "K_l";
      this.status_3 = "attack";
      this.status_6 = "normal";
      this.gotoAndStop(this.status_1);
   }
   function sk_max3()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      var _loc3_ = this.getObjs();
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         if(_loc3_[_loc2_].objName == "card_sss")
         {
            return false;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.status_1 = "sk_max3";
      this.status_3 = "attack";
      this.status_6 = "move";
      this.gotoAndStop(this.status_1);
   }
   function hei2()
   {
      if(this.status_2 != "land")
      {
         if(this.status_1 == "mei" || this.status_1 == "mei_l")
         {
            this.delaySkill = "hei2";
         }
         return false;
      }
      this.status_1 = "hei2";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function hei2_l()
   {
      if(this.status_2 != "land")
      {
         if(this.status_1 == "mei" || this.status_1 == "mei_l")
         {
            this.delaySkill = "hei2_l";
         }
         return false;
      }
      this.status_1 = "hei2_l";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function hei3()
   {
      if(this.status_2 != "land")
      {
         if(this.status_1 == "mei2" || this.status_1 == "mei2_l")
         {
            this.delaySkill = "hei3";
         }
         return false;
      }
      this.status_1 = "hei3";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function hei3_l()
   {
      if(this.status_2 != "land")
      {
         if(this.status_1 == "mei2" || this.status_1 == "mei2_l")
         {
            this.delaySkill = "hei3_l";
         }
         return false;
      }
      this.status_1 = "hei3_l";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function hong2()
   {
      if(this.status_2 != "land")
      {
         if(this.status_1 == "mei" || this.status_1 == "mei_l")
         {
            this.delaySkill = "hong2";
         }
         return false;
      }
      this.status_1 = "hong2";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function hong2_l()
   {
      if(this.status_2 != "land")
      {
         if(this.status_1 == "mei" || this.status_1 == "mei_l")
         {
            this.delaySkill = "hong2_l";
         }
         return false;
      }
      this.status_1 = "hong2_l";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function hong3()
   {
      if(this.status_2 != "land")
      {
         if(this.status_1 == "mei2" || this.status_1 == "mei2_l")
         {
            this.delaySkill = "hong3";
         }
         return false;
      }
      this.status_1 = "hong3";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function hong3_l()
   {
      if(this.status_2 != "land")
      {
         if(this.status_1 == "mei2" || this.status_1 == "mei2_l")
         {
            this.delaySkill = "hong3_l";
         }
         return false;
      }
      this.status_1 = "hong3_l";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function fang2()
   {
      if(this.status_2 != "land")
      {
         if(this.status_1 == "mei" || this.status_1 == "mei_l")
         {
            this.delaySkill = "fang2";
         }
         return false;
      }
      this.status_1 = "fang2";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function fang2_l()
   {
      if(this.status_2 != "land")
      {
         if(this.status_1 == "mei" || this.status_1 == "mei_l")
         {
            this.delaySkill = "fang2_l";
         }
         return false;
      }
      this.status_1 = "fang2_l";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function fang2_l_ai()
   {
      if(this.status_2 != "land")
      {
         if(this.status_1 == "mei" || this.status_1 == "mei_l")
         {
            this.delaySkill = "fang2_l";
         }
         return false;
      }
      this.gotoAndStop("fang2_l");
      this.status_1 = "fang2_l_ai";
      this.status_3 = "attack";
   }
   function fang3()
   {
      if(this.status_2 != "land")
      {
         if(this.status_1 == "mei2" || this.status_1 == "mei2_l")
         {
            this.delaySkill = "fang3";
         }
         return false;
      }
      this.status_1 = "fang3";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function fang3_l()
   {
      if(this.status_2 != "land")
      {
         if(this.status_1 == "mei2" || this.status_1 == "mei2_l")
         {
            this.delaySkill = "fang3_l";
         }
         return false;
      }
      this.status_1 = "fang3_l";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function fang3_l_ai()
   {
      if(this.status_2 != "land")
      {
         if(this.status_1 == "mei2" || this.status_1 == "mei2_l")
         {
            this.delaySkill = "fang3_l";
         }
         return false;
      }
      this.gotoAndStop("fang3_l");
      this.status_1 = "fang3_l_ai";
      this.status_3 = "attack";
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
         if(Key.isDown(this.f) && this.dir == 1 || Key.isDown(this.b) && this.dir == -1)
         {
            if(this.status_3 == "attack")
            {
               _loc2_ = "ten2";
            }
            else
            {
               _loc2_ = "ten";
            }
         }
         else
         {
            _loc2_ = "squatPunch_l";
         }
      }
      else if(Key.isDown(this.f) && this.dir == 1 || Key.isDown(this.b) && this.dir == -1)
      {
         if(this.status_3 == "attack")
         {
            _loc2_ = "J2";
         }
         else
         {
            _loc2_ = "J";
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

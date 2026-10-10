class HitCheck extends MovieClip
{
   var beatArea;
   var hitChecking;
   var hitTypes;
   var hitValue;
   var nozhuijia;
   var onEnterFrame;
   var opp;
   var role;
   var temp;
   var hit_interval = 20;
   var hitID = "nohit";
   var d_rate2 = 0.1;
   function HitCheck()
   {
      super();
      this._name = "area";
   }
   function start_hitCheck(obj, r)
   {
      this.hitValue = obj;
      this.beatArea = this;
      this.role = r;
      this.opp = this.role.opp;
      if(this.hitValue.status_1 == undefined || this.hitValue.status_1 == "")
      {
         if(this._parent.status_1 == undefined)
         {
            this._parent.status_1 = this.role.status_1;
            this.hitValue.status_1 = this.role.status_1;
         }
         else
         {
            this.hitValue.status_1 = this._parent.status_1;
         }
      }
      if(this.hitValue.status_2 == undefined || this.hitValue.status_2 == "")
      {
         if(this._parent.status_2 == undefined)
         {
            this._parent.status_2 = this.role.status_2;
            this.hitValue.status_2 = this.role.status_2;
         }
         else
         {
            this.hitValue.status_2 = this._parent.status_2;
         }
      }
      var _loc6_;
      var _loc3_;
      if(this.role.player_type == "player")
      {
         _loc6_ = 0;
         while(_loc6_ < this.role.skillName.length)
         {
            if(this.role.skill_last0 == this.role.skillName[_loc6_])
            {
               if(this.hitValue.isXz != true)
               {
                  this.hitValue.d_rate /= this.role.skillNum[_loc6_];
                  _loc3_ = this.hitValue.d_rate * 10;
                  _loc3_ = Math.ceil(_loc3_);
                  this.hitValue.d_rate = _loc3_ / 10;
                  if(this.hitValue.d_rate <= 0.1 && this.hitValue.d_rate > 0)
                  {
                     this.hitValue.d_rate = 0.1;
                  }
               }
               if(this.role.skillNum[_loc6_] >= 10 && _level0.player_type != "trainning")
               {
                  this.hitValue.hurtBack = "";
                  this.hitValue.hurtAway = "hurt6";
                  this.hitValue.Vx = 25;
                  this.hitValue.Vy = 25;
                  this.hitValue.a = 0;
                  this.hitValue.g = 0;
               }
               else if(this.role.skillNum[_loc6_] >= 20)
               {
                  this.hitValue.hurtBack = "";
                  this.hitValue.hurtAway = "hurt6";
                  this.hitValue.Vx = 25;
                  this.hitValue.Vy = 25;
                  this.hitValue.a = 0;
                  this.hitValue.g = 0;
               }
            }
            _loc6_ = _loc6_ + 1;
         }
      }
      else
      {
         _loc6_ = 0;
         while(_loc6_ < this.role.skillName.length)
         {
            if(this.role.skill_now == this.role.skillName[_loc6_])
            {
               if(this.hitValue.isXz != true)
               {
                  this.hitValue.d_rate /= this.role.skillNum[_loc6_];
                  _loc3_ = this.hitValue.d_rate * 10;
                  _loc3_ = Math.ceil(_loc3_);
                  this.hitValue.d_rate = _loc3_ / 10;
                  if(this.hitValue.d_rate <= 0.1 && this.hitValue.d_rate > 0)
                  {
                     this.hitValue.d_rate = 0.1;
                  }
               }
               if(this.role.skillNum[_loc6_] >= 10 && _level0.player_type != "trainning")
               {
                  this.hitValue.hurtBack = "";
                  this.hitValue.hurtAway = "hurt6";
                  this.hitValue.Vx = 25;
                  this.hitValue.Vy = 25;
                  this.hitValue.a = 0;
                  this.hitValue.g = 0;
               }
               else if(this.role.skillNum[_loc6_] >= 20)
               {
                  this.hitValue.hurtBack = "";
                  this.hitValue.hurtAway = "hurt6";
                  this.hitValue.Vx = 25;
                  this.hitValue.Vy = 25;
                  this.hitValue.a = 0;
                  this.hitValue.g = 0;
               }
            }
            _loc6_ = _loc6_ + 1;
         }
      }
      this.temp = this.hitValue.d_rate;
      this.role.onHit = false;
      this.role.hitPos = this.hitValue.hitPos;
      if(!this.hitValue.reCheck && this.opp.status_3 == "hurt")
      {
         return undefined;
      }
      if(this.hitValue.isObj)
      {
         if(this.opp.nobody == true)
         {
            return undefined;
         }
         this.role.flyingObj = this._parent;
      }
      if(this.role.att_mode == null || this.role.att_mode == undefined)
      {
         this.role.att_mode = false;
      }
      if(this.role.att_mode == true)
      {
         if(this.hitValue.hurtAway == "hurt6" && this.hitValue.d_rate > 0.1)
         {
            this.hitValue.hurtAway = "hurt3";
         }
         this.hitValue.d_rate *= 0.8;
      }
      if(this.role.power_mode == null || this.role.power_mode == undefined)
      {
         this.role.power_mode = false;
      }
      if(this.role.power_mode == true)
      {
         this.hitValue.freezeTime2 += 2;
      }
      if(this.opp.status_3 == "attack")
      {
         if(this.role.wireAttack || this.hitValue.hitCrash)
         {
            if(this.opp.comboClass.skill_over[this.opp.status_1] > 0)
            {
               if(this.opp.mc._currentframe < this.opp.comboClass.skill_over[this.opp.status_1])
               {
                  this.hitValue.Vx = 55;
                  this.hitValue.Vy = 25;
                  this.hitValue.hurtBack = "hurt_crash";
                  this.hitValue.hurtAway = "hurt_crash";
               }
            }
            else if(this.opp.mc._currentframe < this.opp.mc._totalframes - 6)
            {
               this.hitValue.Vx = 55;
               this.hitValue.Vy = 25;
               this.hitValue.hurtBack = "hurt_crash";
               this.hitValue.hurtAway = "hurt_crash";
            }
         }
      }
      if(this.hitValue.hurtBack == "hurt_crash" || this.hitValue.hurtAway == "hurt_crash")
      {
         this.hitValue.hurtBack = "";
         this.hitValue.hurtAway = "hurt_crash";
         this.hitValue.Vx = 60;
         this.hitValue.a = 1;
         this.hitValue.Vy = 10;
         this.hitValue.g = 0.1;
         this.role.opp.status_7 = this.hitID;
      }
      if(this.hitValue.defendBackCustom == undefined || this.hitValue.defendBackCustom == null)
      {
         this.hitValue.defendBackCustom = 0;
      }
      var _loc4_;
      if(this.hitValue.nohit_status.length > 0)
      {
         for(_loc6_ in this.hitValue.nohit_status)
         {
            _loc4_ = this.hitValue.nohit_status[_loc6_];
            if(this.opp.status_1 == _loc4_)
            {
               return undefined;
            }
            if(this.opp.status_2 == _loc4_)
            {
               return undefined;
            }
         }
      }
      var _loc5_;
      if(this.hitValue.nohit_skills.length > 0)
      {
         for(_loc6_ in this.hitValue.nohit_skills)
         {
            _loc5_ = String(this.hitValue.nohit_skills[_loc6_]);
            if(String(this.opp.mc.hitSkillName) == _loc5_ && (this.opp.status_3 == "hurt" || this.opp.status_3 == "down"))
            {
               return undefined;
            }
         }
      }
      if(this.hitValue.changeDir && _root.role_mc.dir == _root.role_mc.opp.dir)
      {
         if(_root.role_mc.opp.dir == 1)
         {
            _root.role_mc.chageSide2();
         }
         else
         {
            _root.role_mc.chageSide1();
         }
      }
      this.onEnterFrame = this.do_hitCheck;
      this.do_hitCheck();
   }
   function do_hitCheck()
   {
      if(this.hitValue.isGd != true)
      {
         if(this.role.mc.isMc == true)
         {
            this.hitTypes = 1;
            if(this.role.mc.hitCount >= 1)
            {
               this.hitValue.d_rate = this.role.mc.sf(this.temp);
            }
            else if(this._parent.isAct == true)
            {
               this.hitTypes = 2;
               if(this._parent.hitCount >= 1)
               {
                  this.hitValue.d_rate = this._parent.sf(this.temp);
               }
            }
         }
      }
      if(_level0.inPause)
      {
         return undefined;
      }
      if(_level0.inFreeze)
      {
         return undefined;
      }
      if(this.hitValue.wanneng != true)
      {
         if(this.opp.status_3 != "attack" || this.opp.status_1 != "stand" || this.opp.status_4 != "hold" || this.opp.status_1 != "pitch2" || this.opp.status_1 != "pitch")
         {
            if(this.opp.nosh == true)
            {
               return undefined;
            }
         }
      }
      if(this.hitValue.wanneng == true)
      {
         if(this.opp.nosh == true && this.opp.status_3 != "hurt")
         {
            return undefined;
         }
      }
      if(this.hitValue.isObj && this.opp.nobody == true)
      {
         return undefined;
      }
      this.hitChecking = true;
      var _loc2_;
      var _loc3_;
      if(this.hitValue.wanneng == true)
      {
         this.opp.nosh = false;
         if(this.opp.mc.body._name != "body" && this.opp.mc.body._name != "body2" && this.opp.status_3 == "hurt")
         {
            if(this.beatArea.hitTest(this.opp.mc) && !((this.opp.status_1 == "getup1" || this.opp.status_1 == "getup2") && this.hitValue.hitPos != "land"))
            {
               this.hitValue.checkTimes--;
               if(this.hitValue.checkTimes == 0)
               {
                  this.stop_hitCheck();
               }
               if(this.hitValue.isObj)
               {
                  this._parent.play();
               }
               _loc2_ = this.d_rate2;
               if(this.nozhuijia == true && (this.opp.status_3 == "hurt" || this.opp.status_3 == "down") && this.hitValue.checkTimes == 0)
               {
                  this.opp.nosh = true;
               }
               if(this.hitID != "" || this.hitID != undefined)
               {
                  this.role.opp.status_7 = this.hitID;
               }
               else
               {
                  this.role.opp.status_7 = "nohit";
               }
               if(this.hitValue.hitSwitch == undefined || this.hitValue.hitSwitch == null)
               {
                  this.hitValue.hitSwitch = false;
               }
               if(this.hitValue.flagHit == undefined || this.hitValue.flagHit == null)
               {
                  this.hitValue.flagHit = "";
               }
               if(this.hitValue.hitDownRoll || this.hitValue.hitDownRoll == undefined)
               {
                  this.opp.hitDownRoll = true;
               }
               if(this.hitValue.hitDownFar == false || this.hitValue.hitDownFar == undefined)
               {
                  this.opp.hitDownFar = false;
               }
               if(this.hitValue.hitDownRoll == false || this.hitValue.Vy < 0 || this.hitValue.hitDownFar == true)
               {
                  this.opp.hitDownRoll = false;
               }
               if(this.hitValue.hitDownFar)
               {
                  this.hitValue.end_status = "getup1";
                  this.opp.hitDownFar = true;
                  if(this.hitValue.DownVx > 0)
                  {
                     this.opp.downFarVx = this.hitValue.DownVx;
                  }
                  else if(this.hitValue.DownVx == 0)
                  {
                     this.opp.downFarVx = 20;
                  }
               }
               if(this.hitTypes == 1)
               {
                  this.role.mc.hitCount++;
               }
               else if(this.hitTypes == 2)
               {
                  this._parent.hitCount += 1;
               }
               this.role.doHit(this.hitValue,_loc2_);
               this.opp.doHurt(this.hitValue);
               if(this.hitID != "" || this.hitID != undefined)
               {
                  this.role.opp.status_7 = this.hitID;
               }
               else
               {
                  this.role.opp.status_7 = "nohit";
               }
               if(this.hitValue.hitSwitch && this.hitValue.flagHit != "")
               {
                  if(this.hitID != "" || this.hitID != undefined)
                  {
                     this.role.opp.status_7 = this.hitID;
                  }
                  else
                  {
                     this.role.opp.status_7 = "nohit";
                  }
                  if(this.role.opp.status_7 != "normal")
                  {
                     this._parent.gotoAndPlay(this.hitValue.flagHit);
                  }
               }
            }
         }
         else if((this.beatArea.hitTest(this.opp.mc.body) || this.beatArea.hitTest(this.opp.mc.body2)) && !((this.opp.status_1 == "getup1" || this.opp.status_1 == "getup2") && this.hitValue.hitPos != "land"))
         {
            this.hitValue.checkTimes--;
            if(this.hitValue.checkTimes == 0)
            {
               this.stop_hitCheck();
            }
            if(this.hitValue.isObj)
            {
               this._parent.play();
            }
            _loc2_ = this.d_rate2;
            if(this.nozhuijia == true && (this.opp.status_3 == "hurt" || this.opp.status_3 == "down") && this.hitValue.checkTimes == 0)
            {
               this.opp.nosh = true;
            }
            if(this.hitID != "" || this.hitID != undefined)
            {
               this.role.opp.status_7 = this.hitID;
            }
            else
            {
               this.role.opp.status_7 = "nohit";
            }
            if(this.hitValue.hitSwitch == undefined || this.hitValue.hitSwitch == null)
            {
               this.hitValue.hitSwitch = false;
            }
            if(this.hitValue.flagHit == undefined || this.hitValue.flagHit == null)
            {
               this.hitValue.flagHit = "";
            }
            if(this.hitValue.hitDownRoll || this.hitValue.hitDownRoll == undefined)
            {
               this.opp.hitDownRoll = true;
            }
            if(this.hitValue.hitDownFar == false || this.hitValue.hitDownFar == undefined)
            {
               this.opp.hitDownFar = false;
            }
            if(this.hitValue.hitDownRoll == false || this.hitValue.Vy < 0 || this.hitValue.hitDownFar == true)
            {
               this.opp.hitDownRoll = false;
            }
            if(this.hitValue.hitDownFar)
            {
               this.hitValue.end_status = "getup1";
               this.opp.hitDownFar = true;
               if(this.hitValue.DownVx > 0)
               {
                  this.opp.downFarVx = this.hitValue.DownVx;
               }
               else if(this.hitValue.DownVx == 0)
               {
                  this.opp.downFarVx = 20;
               }
            }
            if(this.hitTypes == 1)
            {
               this.role.mc.hitCount++;
            }
            else if(this.hitTypes == 2)
            {
               this._parent.hitCount += 1;
            }
            this.role.doHit(this.hitValue,_loc2_);
            _loc3_ = this.opp.doHurt(this.hitValue);
            if(this.hitID != "" || this.hitID != undefined)
            {
               this.role.opp.status_7 = this.hitID;
            }
            else
            {
               this.role.opp.status_7 = "nohit";
            }
            if(this.hitValue.hitSwitch && this.hitValue.flagHit != "")
            {
               if(this.hitID != "" || this.hitID != undefined)
               {
                  this.role.opp.status_7 = this.hitID;
               }
               else
               {
                  this.role.opp.status_7 = "nohit";
               }
               if(this.role.opp.status_7 != "normal")
               {
                  this._parent.gotoAndPlay(this.hitValue.flagHit);
               }
            }
         }
      }
      else if((this.beatArea.hitTest(this.opp.mc.body) || this.beatArea.hitTest(this.opp.mc.body2)) && !(this.opp.status_3 == "down" && this.hitValue.hitPos != "land"))
      {
         this.hitValue.checkTimes--;
         if(this.hitValue.checkTimes == 0)
         {
            this.stop_hitCheck();
         }
         if(this.hitValue.isObj)
         {
            this._parent.play();
         }
         _loc2_ = this.d_rate2;
         if(this.nozhuijia == true && (this.opp.status_3 == "hurt" || this.opp.status_3 == "down") && this.hitValue.checkTimes == 0)
         {
            this.opp.nosh = true;
         }
         if(this.hitID != "" || this.hitID != undefined)
         {
            this.role.opp.status_7 = this.hitID;
         }
         else
         {
            this.role.opp.status_7 = "nohit";
         }
         if(this.hitValue.hitSwitch == undefined || this.hitValue.hitSwitch == null)
         {
            this.hitValue.hitSwitch = false;
         }
         if(this.hitValue.flagHit == undefined || this.hitValue.flagHit == null)
         {
            this.hitValue.flagHit = "";
         }
         if(this.hitValue.hitDownRoll || this.hitValue.hitDownRoll == undefined)
         {
            this.opp.hitDownRoll = true;
         }
         if(this.hitValue.hitDownFar == false || this.hitValue.hitDownFar == undefined)
         {
            this.opp.hitDownFar = false;
         }
         if(this.hitValue.hitDownRoll == false || this.hitValue.Vy < 0 || this.hitValue.hitDownFar == true)
         {
            this.opp.hitDownRoll = false;
         }
         if(this.hitValue.hitDownFar)
         {
            this.hitValue.end_status = "getup1";
            this.opp.hitDownFar = true;
            if(this.hitValue.DownVx > 0)
            {
               this.opp.downFarVx = this.hitValue.DownVx;
            }
            else if(this.hitValue.DownVx == 0)
            {
               this.opp.downFarVx = 20;
            }
         }
         if(this.hitTypes == 1)
         {
            this.role.mc.hitCount++;
         }
         else if(this.hitTypes == 2)
         {
            this._parent.hitCount += 1;
         }
         this.role.doHit(this.hitValue,_loc2_);
         this.opp.doHurt(this.hitValue);
         if(this.hitID != "" || this.hitID != undefined)
         {
            this.role.opp.status_7 = this.hitID;
         }
         else
         {
            this.role.opp.status_7 = "nohit";
         }
         if(this.hitValue.hitSwitch && this.hitValue.flagHit != "")
         {
            if(this.hitID != "" || this.hitID != undefined)
            {
               this.role.opp.status_7 = this.hitID;
            }
            else
            {
               this.role.opp.status_7 = "nohit";
            }
            if(this.role.opp.status_7 != "normal")
            {
               this._parent.gotoAndPlay(this.hitValue.flagHit);
            }
         }
      }
   }
   function stop_hitCheck()
   {
      this.role.wireAttack = false;
      this.role.wireTrue = true;
      this.hitChecking = false;
      delete this.onEnterFrame;
   }
   function getPosY()
   {
      var _loc2_ = new Object();
      _loc2_.x = this._x;
      _loc2_.y = this._y;
      this._parent.localToGlobal(_loc2_);
      return _loc2_.y;
   }
}

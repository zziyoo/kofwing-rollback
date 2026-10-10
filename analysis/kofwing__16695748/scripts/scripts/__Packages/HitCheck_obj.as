class HitCheck_obj extends MovieClip
{
   var back;
   var beatArea;
   var dir;
   var hitID;
   var hitTypes;
   var hitValue;
   var nozhuijia;
   var obj_Vx;
   var obj_Vy;
   var obj_level;
   var onEnterFrame;
   var opp;
   var role;
   var temp;
   var d_rate2 = 0.1;
   function HitCheck_obj()
   {
      super();
      this._name = "area";
      this.dir = this._parent.dir;
      this.role.dirs = this._parent.dir;
      this.back = false;
   }
   function start_hitCheck(obj, r)
   {
      var _loc4_;
      if(_level0.debugTest)
      {
         this._visible = true;
         _loc4_ = new Color("this");
         _loc4_.setRGB(13158);
      }
      this.hitValue = obj;
      this.beatArea = this;
      if(this.hitValue.defendBackCustom == undefined || this.hitValue.defendBackCustom == null)
      {
         this.hitValue.defendBackCustom = 0;
      }
      this._parent.obj_level = this.obj_level;
      this.role = r;
      this.opp = this.role.opp;
      if(this.hitValue.status_1 == undefined || this.hitValue.status_1 == "")
      {
         if(this._parent.status_1 == undefined)
         {
            this._parent.status_1 = this.role.status_1;
            this.hitValue.status_1 = this.role.status_1;
         }
      }
      if(this.hitValue.status_2 == undefined || this.hitValue.status_2 == "")
      {
         if(this._parent.status_2 == undefined)
         {
            this._parent.status_2 = this.role.status_2;
            this.hitValue.status_2 = this.role.status_2;
         }
      }
      var _loc2_;
      var _loc3_;
      if(this.role.player_type == "player")
      {
         _loc2_ = 0;
         while(_loc2_ < this.role.skillName.length)
         {
            if(this.role.skill_last0 == this.role.skillName[_loc2_])
            {
               if(this.hitValue.isXz != true)
               {
                  this.hitValue.d_rate /= this.role.skillNum[_loc2_];
                  _loc3_ = this.hitValue.d_rate * 10;
                  _loc3_ = Math.ceil(_loc3_);
                  this.hitValue.d_rate = _loc3_ / 10;
                  if(this.hitValue.d_rate <= 0.1 && this.hitValue.d_rate > 0)
                  {
                     this.hitValue.d_rate = 0.1;
                  }
               }
               if(this.role.skillNum[_loc2_] >= 10 && _level0.player_type != "trainning")
               {
                  this.hitValue.hurtBack = "";
                  this.hitValue.hurtAway = "hurt6";
                  this.hitValue.Vx = 25;
                  this.hitValue.Vy = 25;
                  this.hitValue.a = 0;
                  this.hitValue.g = 0;
               }
               else if(this.role.skillNum[_loc2_] >= 20)
               {
                  this.hitValue.hurtBack = "";
                  this.hitValue.hurtAway = "hurt6";
                  this.hitValue.Vx = 25;
                  this.hitValue.Vy = 25;
                  this.hitValue.a = 0;
                  this.hitValue.g = 0;
               }
            }
            _loc2_ = _loc2_ + 1;
         }
      }
      else
      {
         _loc2_ = 0;
         while(_loc2_ < this.role.skillName.length)
         {
            if(this.role.skill_now == this.role.skillName[_loc2_])
            {
               if(this.hitValue.isXz != true)
               {
                  this.hitValue.d_rate /= this.role.skillNum[_loc2_];
                  _loc3_ = this.hitValue.d_rate * 10;
                  _loc3_ = Math.ceil(_loc3_);
                  this.hitValue.d_rate = _loc3_ / 10;
                  if(this.hitValue.d_rate <= 0.1 && this.hitValue.d_rate > 0)
                  {
                     this.hitValue.d_rate = 0.1;
                  }
               }
               if(this.role.skillNum[_loc2_] >= 10 && _level0.player_type != "trainning")
               {
                  this.hitValue.hurtBack = "";
                  this.hitValue.hurtAway = "hurt6";
                  this.hitValue.Vx = 25;
                  this.hitValue.Vy = 25;
                  this.hitValue.a = 0;
                  this.hitValue.g = 0;
               }
               else if(this.role.skillNum[_loc2_] >= 20)
               {
                  this.hitValue.hurtBack = "";
                  this.hitValue.hurtAway = "hurt6";
                  this.hitValue.Vx = 25;
                  this.hitValue.Vy = 25;
                  this.hitValue.a = 0;
                  this.hitValue.g = 0;
               }
            }
            _loc2_ = _loc2_ + 1;
         }
      }
      this.temp = this.hitValue.d_rate;
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
      if(this.opp.status_3 == "hurt" && !this.hitValue.reCheck)
      {
         return undefined;
      }
      if(this.hitValue.isObj)
      {
         this.role.flyingObj = this._parent;
      }
      this.onEnterFrame = this.do_hitCheck;
      this.do_hitCheck();
   }
   function do_hitCheck(a)
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
      if(this.obj_Vx != 0 || this.obj_Vy != 0)
      {
         this.do_move();
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
      if(this.hitValue.wanneng == true)
      {
         if(this.hitValue.hitPos != "land")
         {
            if(this.opp.status_1 == "getup1" || this.opp.status_1 == "getup2")
            {
               return undefined;
            }
         }
      }
      else if(this.opp.status_3 == "down" && this.hitValue.hitPos != "land")
      {
         return undefined;
      }
      var _loc3_;
      if(this.hitValue.nohit_status.length > 0)
      {
         for(var _loc6_ in this.hitValue.nohit_status)
         {
            _loc3_ = this.hitValue.nohit_status[_loc6_];
            if(this.opp.status_1 == _loc3_)
            {
               return undefined;
            }
            if(this.opp.status_2 == _loc3_)
            {
               return undefined;
            }
         }
      }
      var _loc4_;
      if(this.hitValue.nohit_skills.length > 0)
      {
         for(_loc6_ in this.hitValue.nohit_skills)
         {
            _loc4_ = this.hitValue.nohit_skills[_loc6_];
            if(this.role.skill_last == _loc4_ && (this.opp.status_3 == "hurt" || this.opp.status_3 == "down"))
            {
               return undefined;
            }
         }
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
      if(this.hitValue.force == undefined)
      {
         this.hitValue.force = false;
      }
      var _loc5_;
      var _loc2_;
      if(this.hitValue.isObj)
      {
         _loc5_ = this.opp._parent.skill_loader;
         if(_loc5_.getNextHighestDepth() > 0)
         {
            for(_loc6_ in _loc5_)
            {
               _loc2_ = _loc5_[_loc6_].area;
               if(_loc2_ != this)
               {
                  if(_loc2_.hitTest(this))
                  {
                     if(this.obj_level > _loc2_.obj_level)
                     {
                        if(_loc2_.hitValue.force == true)
                        {
                           _loc2_.do_hitObj();
                           this.do_hitObj();
                        }
                        else
                        {
                           _loc2_.do_hitObj();
                        }
                     }
                     else if(this.obj_level == _loc2_.obj_level)
                     {
                        _loc2_.do_hitObj();
                        this.do_hitObj();
                     }
                     else
                     {
                        _loc2_.obj_level = _loc2_.obj_level - 1;
                        if(this.hitValue.force == true)
                        {
                           this.do_hitObj();
                           _loc2_.do_hitObj();
                        }
                        else
                        {
                           this.do_hitObj();
                        }
                     }
                  }
               }
            }
         }
      }
      if(this.opp.nobody == true)
      {
         return undefined;
      }
      if(this.hitValue.wanneng == true)
      {
         this.opp.nosh = false;
         if(this.opp.mc.body._name != "body" && this.opp.mc.body._name != "body2" && this.opp.status_3 == "hurt")
         {
            if(this.beatArea.hitTest(this.opp.mc) && !((this.opp.status_1 == "getup1" || this.opp.status_1 == "getup2") && this.hitValue.hitPos != "land"))
            {
               this.role.onHit = true;
               if(this.hitID != "" || this.hitID != undefined)
               {
                  this.role.opp.status_7 = this.hitID;
               }
               else
               {
                  this.role.opp.status_7 = "nohit";
               }
               this.hitValue.checkTimes--;
               if(this.nozhuijia == true && (this.opp.status_3 == "hurt" || this.opp.status_3 == "down") && this.hitValue.checkTimes == 0)
               {
                  this.opp.nosh = true;
               }
               a = this.d_rate2;
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
               this.role.doHit(this.hitValue,a);
               this.opp.doHurt(this.hitValue);
               if(this.hitTypes == 1)
               {
                  this.role.mc.hitCount += 1;
               }
               else if(this.hitTypes == 2)
               {
                  this._parent.hitCount += 1;
               }
               if(this.hitValue.checkTimes == 0)
               {
                  this.stop_hitCheck();
               }
               if(this.hitValue.isObj)
               {
                  this.do_hitOpp();
               }
            }
         }
         else if(this.beatArea.hitTest(this.opp.mc.body) || this.beatArea.hitTest(this.opp.mc.body2))
         {
            this.role.onHit = true;
            if(this.hitID != "" || this.hitID != undefined)
            {
               this.role.opp.status_7 = this.hitID;
            }
            else
            {
               this.role.opp.status_7 = "nohit";
            }
            this.hitValue.checkTimes--;
            if(this.nozhuijia == true && (this.opp.status_3 == "hurt" || this.opp.status_3 == "down") && this.hitValue.checkTimes == 0)
            {
               this.opp.nosh = true;
            }
            a = this.d_rate2;
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
            this.role.doHit(this.hitValue,a);
            this.opp.doHurt(this.hitValue);
            if(this.hitTypes == 1)
            {
               this.role.mc.hitCount += 1;
            }
            else if(this.hitTypes == 2)
            {
               this._parent.hitCount += 1;
            }
            if(this.hitValue.checkTimes == 0)
            {
               this.stop_hitCheck();
            }
            if(this.hitValue.isObj)
            {
               this.do_hitOpp();
            }
         }
      }
      else if(this.beatArea.hitTest(this.opp.mc.body) || this.beatArea.hitTest(this.opp.mc.body2))
      {
         this.role.onHit = true;
         if(this.hitID != "" || this.hitID != undefined)
         {
            this.role.opp.status_7 = this.hitID;
         }
         else
         {
            this.role.opp.status_7 = "nohit";
         }
         this.hitValue.checkTimes--;
         if(this.nozhuijia == true && (this.opp.status_3 == "hurt" || this.opp.status_3 == "down") && this.hitValue.checkTimes == 0)
         {
            this.opp.nosh = true;
         }
         a = this.d_rate2;
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
         this.role.doHit(this.hitValue,a);
         this.opp.doHurt(this.hitValue);
         if(this.hitTypes == 1)
         {
            this.role.mc.hitCount += 1;
         }
         else if(this.hitTypes == 2)
         {
            this._parent.hitCount += 1;
         }
         if(this.hitValue.checkTimes == 0)
         {
            this.stop_hitCheck();
         }
         if(this.hitValue.isObj)
         {
            this.do_hitOpp();
         }
      }
      else
      {
         this.role.onHit = false;
      }
   }
   function do_move()
   {
      if(_level0.inPause)
      {
         return undefined;
      }
      if(_level0.inFreeze)
      {
         return undefined;
      }
      if(this.obj_Vx != 0)
      {
         this._parent._x += this.obj_Vx * this.dir;
      }
      if(this.obj_Vy != 0)
      {
         this._parent._y += this.obj_Vy;
      }
      if(this.hitValue.accel != 0 && this.hitValue.accel != undefined)
      {
         this.obj_Vx += this.hitValue.accel;
      }
      if(this.hitValue.slowdown != 0 && this.hitValue.slowdown != undefined)
      {
         this.obj_Vx += this.hitValue.slowdown;
      }
      var _loc2_ = this._parent._x + _level0.char_mc._x;
      var _loc3_ = this._parent._y + _level0.char_mc._y;
      if(_loc2_ > 963 || _loc2_ < -110)
      {
         this._parent.removeMovieClip();
      }
      if(this._parent._y >= _level0.land_Y && this.obj_Vy > 0)
      {
         this._parent._y = _level0.land_Y;
         this.do_hitOpp();
      }
      _level0.out("_parent._y:" + this._parent._y + "   " + _level0.land_Y + "   " + this.obj_Vy);
   }
   function stop_hitCheck()
   {
      if(this.hitValue.conV)
      {
         this.onEnterFrame = this.do_move;
         this.do_move();
      }
      else
      {
         delete this.onEnterFrame;
      }
   }
   function getPosY()
   {
      var _loc2_ = new Object();
      _loc2_.x = this._x;
      _loc2_.y = this._y;
      this._parent.localToGlobal(_loc2_);
      return _loc2_.y;
   }
   function do_hitOpp()
   {
      this.stop_hitCheck();
      if(this.back == true)
      {
         this._parent.removeMovieClip();
      }
      if(this._parent.hit != undefined)
      {
         this._parent.hit();
      }
      else
      {
         this._parent.play();
      }
   }
   function do_hitObj()
   {
      this.stop_hitCheck();
      if(this.back == true)
      {
         this._parent.removeMovieClip();
      }
      if(this._parent.hit != undefined)
      {
         this._parent.hit();
      }
      else
      {
         this._parent.play();
      }
   }
   function hitBack()
   {
      this.back = true;
      this.dir = - this.dir;
      this._parent._xscale = - this._parent._xscale;
      if(this.obj_Vy != 0 || this.obj_Vy > 0)
      {
         this.obj_Vy = - this.obj_Vy;
         if(this.opp.opp._roleName != "Haohmaru")
         {
            this._parent._yscale = - this._parent._yscale;
         }
      }
      this.start_hitCheck(this.hitValue,this.opp);
   }
}

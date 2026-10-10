class Life_Power extends MovieClip
{
   var burst_len;
   var burst_mc;
   var burst_power;
   var burst_powerMax;
   var d_h;
   var d_p;
   var life2_mc;
   var lifeBar_length;
   var lifeBar_mc;
   var lifeBar_num;
   var lifeBar_num_max;
   var life_d;
   var life_length;
   var life_max;
   var life_mc;
   var life_now;
   var life_num;
   var onEnterFrame;
   var powerBar_length;
   var powerBar_mc;
   var powerPoint_max;
   var powerPoint_num;
   var power_length;
   var power_max;
   var power_mc;
   var power_now;
   var role;
   var is2V2 = false;
   var is3V3 = false;
   var inBurst = false;
   var acc_damage = 0;
   var debugTarget = "p1";
   var showAcc = false;
   function Life_Power()
   {
      super();
      this.init_life();
      this.init_power();
   }
   function init_life()
   {
      this.life_max = _level0.life_max;
      this.lifeBar_num = _level0.lifeBar_num;
      this.lifeBar_num_max = _level0.lifeBar_num;
      if(_level0.charSelect_P13 != "undefined" && _level0.charSelect_P13 != undefined && _level0.charSelect_P13 != "")
      {
         this.is3V3 = true;
      }
      if(_level0.charSelect_P12 != "undefined" && _level0.charSelect_P12 != undefined && _level0.charSelect_P12 != "" && this.is3V3 != true)
      {
         this.is2V2 = true;
      }
      if(_level0.player_type == "1PVSCOM" && (_level0.stageID == 3 || _level0.stageID == 7 || _level0.stageID == 8) && this == _level0.LP_P2 && this.is2V2)
      {
         this.lifeBar_num = Math.ceil(_level0.lifeBar_num * 2);
         this.lifeBar_num_max = Math.ceil(_level0.lifeBar_num * 2);
      }
      if(_level0.player_type == "1PVSCOM" && (_level0.stageID == 2 || _level0.stageID == 5 || _level0.stageID == 6) && this == _level0.LP_P2 && this.is3V3)
      {
         this.lifeBar_num = Math.ceil(_level0.lifeBar_num * 2);
         this.lifeBar_num_max = Math.ceil(_level0.lifeBar_num * 2);
      }
      this.life_now = this.life_max;
      if(this == _level0.LP_P2 && _level0.serviceName == "life" && this.lifeBar_num > 1)
      {
         this.lifeBar_num = this.lifeBar_num - 1;
         this.lifeBar_num_max = this.lifeBar_num_max - 1;
      }
      this.life_num.gotoAndStop(this.lifeBar_num);
      this.life_d = 30;
      this.d_p = 30;
      this.d_h = 2;
      this.life_mc = this.lifeBar_mc.bar;
      this.life2_mc = this.lifeBar_mc.bar2;
      this.lifeBar_length = this.life_mc._width;
      _level0.out("lifeBar_num:" + this.lifeBar_num + "   " + this.life_now);
   }
   function reset()
   {
      this.lifeBar_num = _level0.lifeBar_num;
      this.lifeBar_num_max = _level0.lifeBar_num;
      if(_level0.charSelect_P13 != "undefined" && _level0.charSelect_P13 != undefined && _level0.charSelect_P13 != "")
      {
         this.is3V3 = true;
      }
      if(_level0.charSelect_P12 != "undefined" && _level0.charSelect_P12 != undefined && _level0.charSelect_P12 != "" && this.is3V3 != true)
      {
         this.is2V2 = true;
      }
      if(_level0.player_type == "1PVSCOM" && (_level0.stageID == 3 || _level0.stageID == 7 || _level0.stageID == 8) && this == _level0.LP_P2 && this.is2V2)
      {
         this.lifeBar_num = Math.ceil(_level0.lifeBar_num * 2);
         this.lifeBar_num_max = Math.ceil(_level0.lifeBar_num * 2);
      }
      if(_level0.player_type == "1PVSCOM" && (_level0.stageID == 2 || _level0.stageID == 5 || _level0.stageID == 6) && this == _level0.LP_P2 && this.is3V3)
      {
         this.lifeBar_num = Math.ceil(_level0.lifeBar_num * 2);
         this.lifeBar_num_max = Math.ceil(_level0.lifeBar_num * 2);
      }
      if(this == _level0.LP_P2 && _level0.serviceName == "life" && this.lifeBar_num > 1)
      {
         this.lifeBar_num = this.lifeBar_num - 1;
         this.lifeBar_num_max = this.lifeBar_num_max - 1;
      }
      this.life_num.gotoAndStop(this.lifeBar_num);
      this.life_now = this.life_max;
      this.life_mc._width = this.lifeBar_length;
      this.lifeBar_mc.lifeBg.gotoAndStop(1);
   }
   function lifeControl(Obj, hpadd)
   {
      var _loc2_ = Obj.d_rate;
      if(_loc2_ == undefined)
      {
         _loc2_ = 1;
      }
      if(_level0.player_type == "1PVSCOM" && this == _level0.LP_P2 && _loc2_ > 0)
      {
         if(_level0.charSelect_P13 != "undefined" && _level0.charSelect_P13 != undefined && _level0.charSelect_P13 != "")
         {
            this.is3V3 = true;
         }
         if(_level0.charSelect_P12 != "undefined" && _level0.charSelect_P12 != undefined && _level0.charSelect_P12 != "" && this.is3V3 != true)
         {
            this.is2V2 = true;
         }
         if((_level0.stageID == 2 || _level0.stageID == 5 || _level0.stageID == 6) && this.is3V3)
         {
            _loc2_ *= 0.66;
         }
      }
      if(this.role.inBurst && this.role.burst_mode == "defend")
      {
         _loc2_ *= 0.8;
      }
      if(_level0.KO && _loc2_ > 0)
      {
         return false;
      }
      if(_level0.checkNoEnemyMode(this.role) && !_level0.KO)
      {
         return false;
      }
      if(_level0.timeOver)
      {
         return false;
      }
      if(this.life_now == 0)
      {
         return undefined;
      }
      var _loc3_ = _loc2_ * this.d_p;
      this.life_now -= _loc3_;
      Obj.target.life -= _loc3_;
      if(this.role.opp.mc.continueHit && this.life_now <= 0 && this.lifeBar_num == 1)
      {
         this.life_now = 1;
      }
      if(this.life_now >= 300.1)
      {
         if(_level0.player_type == "trainning" && this.lifeBar_num == -1)
         {
            this.life_now = 300;
         }
         else if(this.lifeBar_num >= this.lifeBar_num_max)
         {
            this.life_now = 300;
         }
         else
         {
            this.lifeBar_num += 1;
            this.life_num.gotoAndStop(this.lifeBar_num);
            this.life_now = 0.1;
         }
      }
      else if(this.life_now <= 0)
      {
         this.lifeBar_num = this.lifeBar_num - 1;
         if(this.lifeBar_num > 0)
         {
            this.life_num.gotoAndStop(this.lifeBar_num);
         }
         _level0.out("lifeBar_num:" + this.lifeBar_num + "     " + this.life_now);
         if(_level0.player_type == "trainning" && this.lifeBar_num < -1)
         {
            this.life_now += this.life_max;
         }
         else if(this.lifeBar_num <= 0)
         {
            this.life_now = 0;
            Obj.target.life = 0;
            this.do_KO(Obj.target);
         }
         else
         {
            this.life_now += this.life_max;
         }
      }
      if(hpadd == true)
      {
         this.lifeBar_mc.bar2._visible = false;
      }
      else
      {
         this.lifeBar_mc.bar2._visible = true;
      }
      this.life_length = this.life_now * this.lifeBar_length / this.life_max;
      this.life_mc._width = this.life_length;
      this.life_dec();
      if(Obj.target.life <= 0 && _level0.player_type != "trainning" && this.lifeBar_num <= 0)
      {
         this.do_KO(Obj.target);
      }
      if(_level0.player_type == "trainning" && _level0.lifeBar_num < 1)
      {
         if(this.role == _level0.P1_role)
         {
            this.debugTarget = "p1";
         }
         else
         {
            this.debugTarget = "p2";
         }
         if(!this.role.opp.mc.continueHit)
         {
            if(this.showAcc)
            {
               this.showAcc = false;
               _level0.life_power_mc.life_debugger.showInfo(this.debugTarget,this.life_now,this.acc_damage,_loc3_);
               this.acc_damage = 0;
            }
            else
            {
               _level0.life_power_mc.life_debugger.showInfo(this.debugTarget,this.life_now,0,_loc3_);
            }
         }
         else
         {
            this.showAcc = true;
            this.acc_damage += _loc3_;
            _level0.life_power_mc.life_debugger.showInfo(this.debugTarget,this.life_now,0,_loc3_);
         }
      }
   }
   function life_dec()
   {
      this.onEnterFrame = function()
      {
         if(_level0.inPause)
         {
            return undefined;
         }
         if(_level0.inFreeze)
         {
            return undefined;
         }
         this.life2_mc._width -= 2;
         if(this.life2_mc._width <= this.life_mc._width)
         {
            this.life2_mc._width = this.life_mc._width;
            delete this.onEnterFrame;
         }
         this.redBlood();
      };
   }
   function do_KO(role)
   {
      var _loc2_ = new Sound();
      _loc2_.attachSound("lastKO");
      _loc2_.start();
      if(_level0.autoPlayGame)
      {
         _level0.autoSelectRank = true;
         _level0.autoPlayGameGotoDisplay();
      }
      else
      {
         _level0.do_KO(role,role.opp);
         _level0.actionSet(_level0.P1_role,"control");
         _level0.actionSet(_level0.P2_role,"control");
         _level0.life_power_mc.oppset._visible = false;
         this.lifeBar_mc.lifeBg.gotoAndStop(1);
      }
   }
   function redBlood()
   {
      if(_level0.checkPowerNoLimit(this.role))
      {
         if(this.life_mc._width < this.lifeBar_length / 4 && !this.role.redBlood)
         {
            this.lifeBar_mc.lifeBg.gotoAndPlay(2);
            this.role.redBlood = true;
         }
         else if(this.life_mc._width >= this.lifeBar_length / 4 && this.role.redBlood)
         {
            this.lifeBar_mc.lifeBg.gotoAndStop(1);
            this.role.redBlood = false;
         }
         return undefined;
      }
      if(this.role.life >= this.role.life_max / 4 && this.role.redBlood)
      {
         this.lifeBar_mc.lifeBg.gotoAndStop(1);
         this.role.redBlood = false;
      }
      this.role.life = this.role.life * 0 + this.life_max * (this.lifeBar_num - 1) + this.life_now;
      this.role.life_max = this.role.life_max * 0 + this.life_max * this.lifeBar_num_max;
      if(this.role == _level0.LP_P1)
      {
         _level0.currentLifeP1 = this.role.life;
         _level0.lifeMaxP1 = this.role.life_max;
         _level0.LP_P1.life_max = this.role.life_max;
         _level0.LP_P1.life = this.role.life;
      }
      else if(this.role == _level0.LP_P2)
      {
         _level0.currentLifeP2 = this.role.life;
         _level0.lifeMaxP2 = this.role.life_max;
         _level0.LP_P2.life_max = this.role.life_max;
         _level0.LP_P2.life = this.role.life;
      }
      if(this.role.life < 0)
      {
         this.role.life = 0;
      }
      if(this.role.life < this.role.life_max / 4 && !this.role.redBlood)
      {
         this.lifeBar_mc.lifeBg.gotoAndPlay(2);
         this.role.redBlood = true;
      }
   }
   function init_power()
   {
      this.power_max = _level0.power_max;
      this.powerPoint_num = _level0.superPoint;
      this.powerBar_mc.point_mc.gotoAndStop(this.powerPoint_num + 1);
      this.powerPoint_max = _level0.powerPoint_max;
      if(this.powerPoint_num == this.powerPoint_max)
      {
         this.powerBar_mc.gotoAndStop("max");
      }
      else
      {
         this.powerBar_mc.gotoAndStop(1);
      }
      this.power_now = 0;
      this.power_mc = this.powerBar_mc.bar;
      this.powerBar_length = this.power_mc._width;
      this.power_mc._width = this.power_now;
      this.burst_power = 0;
      this.burst_powerMax = 300;
      this.burst_len = this.burst_mc.burst_bar.mask._width;
   }
   function reset_power()
   {
      this.power_max = _level0.power_max;
      this.powerPoint_num = _level0.superPoint;
      this.role.superPoint = _level0.superPoint;
      this.powerPoint_max = _level0.powerPoint_max;
      this.powerBar_mc.point_mc.gotoAndStop(this.powerPoint_num + 1);
      this.powerBar_mc.bar = 2;
      if(this.powerPoint_num == this.powerPoint_max)
      {
         this.powerBar_mc.gotoAndStop("max");
      }
      else
      {
         this.powerBar_mc.gotoAndStop(1);
      }
      this.power_now = 0;
      this.burst_power = 0;
      this.burst_powerMax = 300;
   }
   function powerControl(Obj)
   {
      if(Obj.action == "dec")
      {
         if(_level0.checkPowerNoLimit(this.role))
         {
            return false;
         }
         if(this.powerPoint_num == 0)
         {
            return false;
         }
         this.powerPoint_num = this.powerPoint_num - 1;
         Obj.target.superPoint = this.powerPoint_num;
         this.point_dec();
         if(this.role == _level0.P1_role && _level0.serviceName == "power")
         {
            this.power_now += 40;
            this.power_length = this.power_now / this.power_max * this.powerBar_length;
            this.power_mc._width = this.power_length;
         }
         return true;
      }
      if(Obj.action == "burst")
      {
         this.powerBurst();
         this.powerPoint_num = 0;
         Obj.target.superPoint = this.powerPoint_num;
         return true;
      }
      if(Obj.action == "burstdec")
      {
         if(this.role == _level0.P1_role && _level0.serviceName == "power")
         {
            Obj.decNum *= 0.5;
         }
         this.burst_power -= Obj.decNum;
         return true;
      }
      if(this.powerPoint_num == this.powerPoint_max)
      {
         return undefined;
      }
      if(this.role.att_mode == true || this.role.armor_mode == true)
      {
         return undefined;
      }
      var _loc2_ = Obj.inc;
      if(this.role.bloodPower)
      {
         _loc2_ = int(_loc2_ / 5);
      }
      if(this.role.ashPower)
      {
         _loc2_ = int(_loc2_ / 5);
      }
      if(this.role.kyoPower)
      {
         _loc2_ = int(_loc2_ / 5);
      }
      if(this.inBurst)
      {
         _loc2_ = int(_loc2_ / 3);
      }
      if(this.role.power_mode)
      {
         _loc2_ = int(_loc2_);
      }
      if(this.role.superCheck2(this.role.status_1) != "notSuperSkill")
      {
         return undefined;
      }
      if(this.role.burstCheck2(this.role.status_1) != "notBurstSkill")
      {
         return undefined;
      }
      if(this.role.skillSuperCheckNew(this.role.status_1) == true)
      {
         return undefined;
      }
      if(this.role.inBurst)
      {
         return undefined;
      }
      this.power_now += _loc2_;
      if(this.power_now >= this.power_max)
      {
         this.powerPoint_num = this.powerPoint_num + 1;
         Obj.target.superPoint = this.powerPoint_num;
         this.point_add(Obj.target);
         if(this.powerPoint_num == this.powerPoint_max)
         {
            this.power_now = 0;
            this.powerBar_mc.gotoAndStop("max");
         }
         else
         {
            this.power_now -= this.power_max;
         }
      }
      this.power_length = this.power_now / this.power_max * this.powerBar_length;
      this.power_mc._width = this.power_length;
   }
   function point_add()
   {
      this.powerBar_mc.point_mc.nextFrame();
   }
   function point_dec()
   {
      this.powerBar_mc.point_mc.prevFrame();
      this.powerBar_mc.gotoAndStop(1);
   }
   function powerBurst()
   {
      this.inBurst = true;
      this.burst_mc.gotoAndPlay(2);
      this.burst_mc.lv = this.powerPoint_num;
      this.burst_power = this.powerPoint_num * 100;
      this.powerLength();
      this.powerBar_mc.point_mc.gotoAndStop(1);
      this.powerBar_mc.gotoAndStop(1);
   }
   function startBurst()
   {
      if(this.role.burst_mode == "defend")
      {
         this.burst_mc.mode_cn.gotoAndStop("defend");
         this.burst_mc.mode_en.gotoAndStop("defend");
      }
      else if(this.role.burst_mode == "attack")
      {
         this.burst_mc.mode_cn.gotoAndStop("attack");
         this.burst_mc.mode_en.gotoAndStop("attack");
      }
      else
      {
         this.burst_mc.mode_cn.gotoAndStop("power");
         this.burst_mc.mode_en.gotoAndStop("power");
      }
      var owner = this;
      this.burst_mc.onEnterFrame = function()
      {
         if(_level0.inPause)
         {
            return undefined;
         }
         owner.burst_dec();
      };
   }
   function burst_dec()
   {
      this.burst_power -= 0.1;
      if(this.burst_power <= 0)
      {
         this.burst_power = 0;
         this.burst_end();
         delete this.burst_mc.onEnterFrame;
      }
      this.powerLength();
   }
   function burst_end()
   {
      if(!this.inBurst)
      {
         return undefined;
      }
      this.burst_mc.gotoAndPlay("end");
      this.role.burst_end();
      this.inBurst = false;
      if(_level0.checkPowerNoLimit(this.role))
      {
         this.powerPoint_num = 3;
         this.role.superPoint = this.powerPoint_num;
         this.reset_power();
      }
   }
   function showBurst_dec(num)
   {
      this.burst_mc.decNum_mc.play();
      this.burst_mc.decNum_mc.dec_num = num;
   }
   function powerLength()
   {
      var _loc2_ = this.burst_power / this.burst_powerMax * this.burst_len;
      this.burst_mc.burst_bar.mask._width = _loc2_;
      return _loc2_;
   }
}

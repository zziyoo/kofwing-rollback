class Stage_effect extends MovieClip
{
   var KO_Freeze_mc;
   var bgEffKO_mc;
   var bgEff_mc;
   var bgEff_mc2;
   var bgShinngHit_mc;
   var camera_obj;
   var colorObj;
   var hit;
   var hitFreeze_mc;
   var isKO;
   var onEnterFrame;
   var superFreeze_mc;
   var KO_time = 20;
   var depth_bgEff1 = 1000;
   var depth_bgEff2 = 1100;
   var depth_bgEff3 = 1200;
   var depth_bgEff4 = 1300;
   var fireFrame_p1 = new Object();
   var fireFrame_p2 = new Object();
   var firePlay_p1 = new Object();
   var firePlay_p2 = new Object();
   function Stage_effect()
   {
      super();
      this.superFreeze_mc = this.createEmptyMovieClip("superFreeze_mc",this.getNextHighestDepth());
      this.KO_Freeze_mc = this.createEmptyMovieClip("KO_Freeze_mc",this.getNextHighestDepth());
      this.hitFreeze_mc = this.createEmptyMovieClip("hitFreeze_mc",this.getNextHighestDepth());
      this.colorObj = new Object();
      this.colorObj.normal = {ra:"100",rb:"0",ga:"100",gb:"0",ba:"100",bb:"0",aa:"100",ab:"0"};
      this.colorObj.black = {ra:"0",rb:"0",ga:"0",gb:"0",ba:"0",bb:"0",aa:"100",ab:"0"};
      this.colorObj.white = {ra:"100",rb:"255",ga:"100",gb:"255",ba:"100",bb:"255",aa:"100",ab:"255"};
      this.bgShinngHit_mc = _root.fgEff2_mc.attachMovie("bgShinngHit","bgShinngHit_mc",this.depth_bgEff3);
   }
   function hitFire(_hitType, hitFire_x, hitFire_y, dir)
   {
      var _loc4_;
      var _loc2_ = _hitType;
      if(_hitType == "hitFire1")
      {
         _loc4_ = Math.random();
         if(_loc4_ < 0.5)
         {
            _loc2_ = "hitFire_kof_1";
         }
         else
         {
            _loc2_ = "hitFire1";
         }
      }
      var _loc3_ = this.getNextHighestDepth();
      this.hit = this.attachMovie(_loc2_,"hit",_loc3_);
      this.hit._x = hitFire_x;
      this.hit._y = hitFire_y;
      this.hit._xscale *= dir;
   }
   function downEff(hitType, hitFire_x, hitFire_y, dir)
   {
      var _loc3_ = this.getNextHighestDepth();
      var _loc2_ = this.attachMovie(hitType,"down",_loc3_);
      _loc2_._x = hitFire_x;
      _loc2_._y = hitFire_y;
      _loc2_._xscale = dir * 100;
   }
   function bgEff_start(s_type, fromMC, notScale)
   {
      _level0.raining = false;
      if(s_type == "")
      {
         this.bgEff_end();
         return undefined;
      }
      this.bgEff_mc.removeMovieClip();
      this.bgEff_mc = _root.bgEff_mc.attachMovie(s_type,"bgEff",this.depth_bgEff1);
      if(!notScale)
      {
         this.bgEff_mc.mc._xscale *= fromMC._parent.dir;
      }
      var owner = this;
      fromMC.onUnload = function()
      {
         owner.bgEff_end();
      };
   }
   function bgEff_start2(s_type, fromMC)
   {
      _level0.raining = false;
      if(s_type == "")
      {
         this.bgEff_end();
         return undefined;
      }
      this.bgEff_mc2 = _root.bgEff_mc.attachMovie(s_type,"bgEff",this.depth_bgEff1);
      this.bgEff_mc2.mc._xscale *= fromMC._parent.dir;
   }
   function bgEff_end()
   {
      _level0.raining = true;
      this.bgEff_mc.removeMovieClip();
      if(!this.isKO && _level0.P2_role._roleName == "Iori" && _level0.P2_role.roleMode == 3 && _level0.player_type == "1PVSCOM")
      {
         this.bgEff_start("bgEff_bloodiori",_level0.P2_role,false);
      }
   }
   function bgShineHit(type)
   {
      if(type == 2)
      {
         this.bgShinngHit_mc.show2();
      }
      else
      {
         this.bgShinngHit_mc.show1();
      }
   }
   function fgEff_start(s_type, fromMC)
   {
      if(s_type == "")
      {
         this.fgEff_end();
         return undefined;
      }
      var _loc3_ = _root.effect_mc_fg.attachMovie(s_type,"fgEff",this.depth_bgEff1);
      _loc3_.mc._xscale *= fromMC._parent.dir;
      _loc3_._x = - _root.char_mc._x;
      _loc3_._y = 0;
      var owner = this;
      fromMC.onUnload = function()
      {
         owner.fgEff_end();
      };
   }
   function fgEff_end()
   {
      _root.effect_mc_fg.unloadMovie();
   }
   function superStart(s_type, time_f, dx, dy, bgType, roleName, dir, fromMC, role, charmax)
   {
      var _loc10_ = this.getNextHighestDepth();
      var _loc7_ = this.attachMovie(s_type,"ss",_loc10_);
      _loc7_._x = dx;
      _loc7_._y = dy;
      _loc7_._xscale *= dir;
      _loc10_ = _root.effect_mc_bg.getNextHighestDepth();
      var _loc6_ = _root.effect_mc_bg.attachMovie(s_type + "_bg","eff_bg",_loc10_);
      _loc6_._x = dx;
      _loc6_._y = dy;
      _loc6_._xscale *= dir;
      var _loc4_;
      if(s_type == "s2")
      {
         _loc4_ = _root.bgEff_mc.attachMovie("bgEff_super" + bgType,"bgEff",this.depth_bgEff2);
      }
      else if(role._roleName == "Ash" && role.roleMode == 2 && bgType != 0)
      {
         _loc4_ = _root.bgEff_mc.attachMovie("bgEff_superAlpha","bgEff",this.depth_bgEff2);
      }
      else if(!role.bloodPower && !role.kyoPower)
      {
         _loc4_ = _root.bgEff_mc.attachMovie("bgEff_super" + bgType,"bgEff",this.depth_bgEff2);
      }
      _loc4_._x = _root.center_x;
      _loc4_._y = _root.center_y;
      _loc4_._xscale *= dir;
      var _loc9_ = "superface_" + roleName + bgType;
      if(role.bloodPower || role.kyoPower)
      {
         time_f = 1;
      }
      this.superFreeze(time_f);
      var _loc14_;
      if(!role.bloodPower && !role.kyoPower)
      {
         _loc14_ = _loc4_.face_mc.attachMovie(_loc9_,"face",1100);
         if(charmax == true)
         {
            return undefined;
         }
         if(!_level0.XIIIeff)
         {
            if(s_type == "s1" || s_type == "s1_s")
            {
               _level0.zoomControl_mc.zoomIn(_level0.char_mc,role,1.3,0.5);
            }
            else if(s_type == "s2")
            {
               _level0.zoomControl_mc.zoomIn(_level0.char_mc,role,1.4,0.5);
            }
         }
         if(s_type == "s2")
         {
            if(_level0.XIIIeff)
            {
               _level0.zoomControl_mc.zoomIn(_level0.char_mc,role,1.55,0.5);
            }
         }
      }
   }
   function superStart2(s_type, time_f, dx, dy, bgType, roleName, dir, fromMC, role)
   {
      var _loc11_ = this.getNextHighestDepth();
      var _loc5_ = this.attachMovie(s_type,"ss",_loc11_);
      _loc5_._x = dx;
      _loc5_._y = dy;
      _loc5_._xscale *= dir;
      _loc11_ = _root.effect_mc_bg.getNextHighestDepth();
      var _loc3_;
      if(s_type == "s2")
      {
         _loc3_ = _root.bgEff_mc.attachMovie("bgEff_super" + bgType,"bgEff",this.depth_bgEff2);
      }
      else if(role._roleName == "Ash" && role.roleMode == 2 && bgType != 0)
      {
         _loc3_ = _root.bgEff_mc.attachMovie("bgEff_superAlpha","bgEff",this.depth_bgEff2);
      }
      else if(!role.bloodPower && !role.kyoPower)
      {
         _loc3_ = _root.bgEff_mc.attachMovie("bgEff_super" + bgType,"bgEff",this.depth_bgEff2);
      }
      _loc3_._x = _root.center_x;
      _loc3_._y = _root.center_y;
      _loc3_._xscale *= dir;
      var _loc7_ = "superface_" + roleName + bgType;
      if(role.bloodPower || role.kyoPower)
      {
         time_f = 1;
      }
      this.superFreeze(time_f);
      var _loc9_;
      if(!role.bloodPower && !role.kyoPower)
      {
         _loc9_ = _loc3_.face_mc.attachMovie(_loc7_,"face",1100);
         if(_level0.XIIIeff)
         {
         }
         if(s_type == "s2")
         {
         }
      }
   }
   function superFreeze(f)
   {
      var time_f = f;
      var P1_s = _level0.P1_role.mc;
      var P2_s = _level0.P2_role.mc;
      _level0.inFreeze = true;
      _level0.P1_role.inFreeze = true;
      _level0.P2_role.inFreeze = true;
      _level0.raining = false;
      P1_s.stop();
      P2_s.stop();
      var _loc2_ = this;
      this.superFreeze_mc.onEnterFrame = function()
      {
         if(_level0.inPause)
         {
            return undefined;
         }
         if(time_f == 1)
         {
            _level0.zoomControl_mc.zoomBack(0.5);
         }
         if(time_f > 0)
         {
            P1_s.stop();
            P2_s.stop();
            time_f--;
         }
         else
         {
            _level0.inFreeze = false;
            _level0.P1_role.inFreeze = false;
            _level0.P2_role.inFreeze = false;
            P1_s.play();
            P2_s.play();
            _level0.raining = true;
            _level0.P1_role.skill_restart();
            _level0.P2_role.skill_restart();
            delete this.onEnterFrame;
         }
      };
   }
   function timeStop()
   {
      var _loc3_ = _level0.P1_role.mc;
      var _loc2_ = _level0.P2_role.mc;
      _level0.inFreeze = true;
      _level0.P1_role.inFreeze = true;
      _level0.P2_role.inFreeze = true;
      _loc3_.stop();
      _loc2_.stop();
      var _loc4_ = this;
      _loc3_.stop();
      _loc2_.stop();
   }
   function timePlay()
   {
      var _loc3_ = _level0.P1_role.mc;
      var _loc2_ = _level0.P2_role.mc;
      var _loc4_ = this;
      _level0.inFreeze = false;
      _level0.P1_role.inFreeze = false;
      _level0.P2_role.inFreeze = false;
      _loc3_.play();
      _loc2_.play();
      _level0.P1_role.skill_restart();
      _level0.P2_role.skill_restart();
   }
   function KO_Freeze(time_f, KO_type)
   {
      if(this.isKO)
      {
         return undefined;
      }
      this.isKO = true;
      var owner = this;
      var P1_s = _level0.P1_role.mc;
      var P2_s = _level0.P2_role.mc;
      _level0.inFreeze = true;
      _level0.P1_role.inFreeze = true;
      _level0.P2_role.inFreeze = true;
      P1_s.stop();
      P2_s.stop();
      this.KO_eff(KO_type);
      this.KO_Freeze_mc.onEnterFrame = function()
      {
         if(_level0.inPause)
         {
            return undefined;
         }
         if(owner.bgEffKO_mc._currentframe < owner.bgEffKO_mc._totalframes)
         {
            if(time_f > 0)
            {
               P1_s.stop();
               P2_s.stop();
               time_f--;
            }
            else
            {
               _level0.zoomControl_mc.zoomBack(0.5);
               owner.isKO = false;
               _level0.inFreeze = false;
               _level0.P1_role.inFreeze = false;
               _level0.P2_role.inFreeze = false;
               P1_s.play();
               P2_s.play();
               owner.KO_eff_end();
               owner.showOK_txt();
               if((_level0.P1_role.life / _level0.P1_role.life_max == 1 || _level0.P2_role.life / _level0.P2_role.life_max == 1) && _level0.P1_role.life != _level0.P2_role.life)
               {
                  setTimeout(function()
                  {
                     owner.showPerfect();
                  }
                  ,1500);
               }
               delete this.onEnterFrame;
            }
         }
      };
   }
   function hitFreeze(f, target, f_slow)
   {
      if(this.isKO)
      {
         return undefined;
      }
      var time_f = f;
      var P1_s = _level0.P1_role.mc;
      var P2_s = _level0.P2_role.mc;
      _level0.P1_role.inFreeze = true;
      _level0.P2_role.inFreeze = true;
      P1_s.stop();
      P2_s.stop();
      var owner = this;
      this.hitFreeze_mc.onEnterFrame = function()
      {
         if(_level0.inPause)
         {
            return undefined;
         }
         if(owner.isKO)
         {
            return undefined;
         }
         if(target.shakedir == -1)
         {
            target.shakedir = 1;
            target._x += 2;
         }
         else
         {
            target.shakedir = -1;
            target._x -= 2;
         }
         if(time_f > 1)
         {
            P1_s.stop();
            P2_s.stop();
            time_f--;
         }
         else
         {
            _level0.P1_role.inFreeze = false;
            _level0.P2_role.inFreeze = false;
            P1_s.play();
            P2_s.play();
            delete this.onEnterFrame;
         }
      };
   }
   function getFireFrame()
   {
      var _loc4_ = _level0.P1_role.skill_loader;
      var _loc3_ = _level0.P2_role.skill_loader;
      var _loc2_;
      for(var _loc6_ in _loc4_)
      {
         _loc2_ = _loc4_[_loc6_];
         if(_loc2_ instanceof MovieClip)
         {
            this.fireFrame_p1[_loc6_] = {mc:_loc2_,frame:_loc2_._currentframe};
         }
      }
      for(_loc6_ in _loc3_)
      {
         _loc2_ = _loc3_[_loc6_];
         if(_loc2_ instanceof MovieClip)
         {
            this.fireFrame_p2[_loc6_] = {mc:_loc2_,frame:_loc2_._currentframe};
         }
      }
   }
   function checkFireFrame()
   {
      var _loc2_;
      for(var _loc3_ in this.fireFrame_p1)
      {
         _loc2_ = this.fireFrame_p1[_loc3_];
         if(_loc2_.mc._currentframe == _loc2_.frame)
         {
            this.firePlay_p1[_loc3_] = false;
         }
      }
      for(_loc3_ in this.fireFrame_p2)
      {
         _loc2_ = this.fireFrame_p2[_loc3_];
         if(_loc2_.mc._currentframe == _loc2_.frame)
         {
            this.firePlay_p2[_loc3_] = false;
         }
      }
      this.fireFrame_p1 = {};
      this.fireFrame_p2 = {};
   }
   function fire_stop()
   {
      var _loc3_ = _level0.P1_role.skill_loader;
      var _loc2_ = _level0.P2_role.skill_loader;
      for(var _loc4_ in _loc3_)
      {
         _loc3_[_loc4_].stop();
      }
      for(_loc4_ in _loc2_)
      {
         _loc2_[_loc4_].stop();
      }
      for(_loc4_ in this)
      {
         this[_loc4_].stop();
      }
   }
   function fire_continue()
   {
      var _loc4_ = _level0.P1_role.skill_loader;
      var _loc3_ = _level0.P2_role.skill_loader;
      var _loc2_;
      for(var _loc5_ in _loc4_)
      {
         _loc2_ = _loc4_[_loc5_];
         if(this.firePlay_p1[_loc2_._name] != false)
         {
            _loc2_.play();
         }
      }
      for(_loc5_ in _loc3_)
      {
         _loc2_ = _loc3_[_loc5_];
         if(this.firePlay_p2[_loc2_._name] != false)
         {
            _loc2_.play();
         }
      }
      this.firePlay_p1 = [];
      this.firePlay_p2 = [];
      for(_loc5_ in this)
      {
         this[_loc5_].play();
      }
   }
   function showOK_txt()
   {
      _level0.element_mc.attachMovie("KO_mc","KO_mc",_level0.depth_ko,{_x:330,_y:150});
   }
   function showPerfect()
   {
      _level0.element_mc.attachMovie("Perfect_mc","Perfect_mc",_level0.depth_ko,{_x:330,_y:150});
   }
   function KO_camera()
   {
      var _loc3_ = (_level0.P1_role._x + _level0.P2_role._x) / 2;
      var _loc2_ = (_level0.P1_role._y - 100 + (_level0.P2_role._y - 100)) / 2;
      this.camera_obj = this.attachMovie("shinning_g","KO_camera_mc",102,{_x:_loc3_,_y:_loc2_});
   }
   function KO_camera_end()
   {
      this.isKO = false;
      this.camera_obj.removeMovieClip();
   }
   function KO_eff(KO_type)
   {
      var _loc4_ = this.depth_bgEff4;
      var _loc3_;
      _loc3_ = "bgEff_KO";
      this.bgEffKO_mc = _root.bgEff_mc.attachMovie(_loc3_,"bgEff_mc",_loc4_);
      this.KO_camera();
      if(KO_type == "2")
      {
         _loc3_ = "bgEff_KO2";
         this.bgEffKO_mc = _root.bgEff_mc.attachMovie(_loc3_,"bgEff_mc",_loc4_);
      }
      else
      {
         _loc3_ = "bgEff_KO";
         this.bgEffKO_mc = _root.bgEff_mc.attachMovie(_loc3_,"bgEff_mc",_loc4_);
         this.KO_camera();
      }
      var _loc5_;
      if(_level0.winner == _level0.P1_role)
      {
         _loc5_ = _level0.P2_role;
      }
      else if(_level0.winner == _level0.P2_role)
      {
         _loc5_ = _level0.P1_role;
      }
      _level0.zoomControl_mc.zoomIn(_level0.char_mc,_loc5_,1.3,0.6);
   }
   function KO_eff_end()
   {
      this.bgEffKO_mc.removeMovieClip();
      this.changeColor(_level0.P1_mc,"normal");
      this.changeColor(_level0.P2_mc,"normal");
      this.changeColor(_level0.effect_mc,"normal");
      this.KO_camera_end();
   }
   function changeColor(char, cc)
   {
      var _loc2_ = new Color(char);
      var _loc3_ = this.colorObj[cc];
      _loc2_.setTransform(_loc3_);
   }
   function slowEff(time)
   {
      _root.slowEff_mc.setFPSTarget(_level0.P1_role.mc);
      _root.slowEff_mc.setFPS(23,time);
      _root.slowEff_mc2.setFPSTarget(_level0.P2_role.mc);
      _root.slowEff_mc2.setFPS(23,time);
   }
}

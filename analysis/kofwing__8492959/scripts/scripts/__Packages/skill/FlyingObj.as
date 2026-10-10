class skill.FlyingObj extends MovieClip
{
   var beatArea;
   var dir;
   var hitID;
   var hitValue;
   var mc;
   var obj;
   var obj_level;
   var onEnterFrame;
   var opp;
   var role;
   var skill_loader;
   var skill_loader_opp;
   function FlyingObj()
   {
      super();
      this._name = "area";
      this.obj = this._parent;
      this.role = this.obj._root.role_mc;
      this.opp = this.role.opp;
      this.skill_loader = this.role._parent.skill_loader;
      this.skill_loader_opp = this.opp._parent.skill_loader;
   }
   function init_hit(hitV)
   {
      this.hitValue = hitV;
      this.beatArea = this.hitValue.area;
      this.obj_level = this.hitValue.obj_level;
   }
   function do_move()
   {
   }
   function moveX(Vx, _dir)
   {
      if(_dir == undefined)
      {
         this.dir = this.role.dir;
      }
      else
      {
         this.dir = _dir * this.role.dir;
      }
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
         this.obj._x += Vx * this.dir;
         var _loc2_ = this.obj._x + _level0.char_mc._x;
         if(_loc2_ > _level0.stage_with + 100 || _loc2_ < -100)
         {
            delete this.onEnterFrame;
            this.onMoveOut();
         }
         this.hitCheck();
      };
   }
   function moveXY(Vx, Vy, _dir)
   {
      if(_dir == undefined)
      {
         this.dir = this.role.dir;
      }
      else
      {
         this.dir = _dir * this.role.dir;
      }
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
         this.obj._x += Vx * this.dir;
         this.obj._y += Vy;
         var _loc2_ = this.obj._x + _level0.char_mc._x;
         if(_loc2_ > _level0.stage_with + 100 || _loc2_ < -100)
         {
            this.onMoveOut();
         }
         var _loc3_ = this.obj._y + _level0.char_mc._y;
         if(_loc3_ >= _level0.land_Y)
         {
            this.obj._y = _level0.land_Y - _level0.char_mc._y;
            delete this.onEnterFrame;
            this.onLand();
         }
         this.hitCheck();
      };
   }
   function moveAim_obj(V, fromMC, toMC)
   {
      var _loc5_ = Func.lToG(fromMC);
      var _loc3_ = Func.lToG(toMC);
      var _loc4_ = ExtMath.angleOfLine(_loc5_.x,_loc5_.y,_loc3_.x,_loc3_.y);
      var Vx = V * ExtMath.cosD(_loc4_);
      var Vy = V * ExtMath.sinD(_loc4_);
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
         this.obj._x += Vx;
         this.obj._y += Vy;
         var _loc2_ = this.obj._x + _level0.char_mc._x;
         if(_loc2_ > _level0.stage_with + 100 || _loc2_ < -100)
         {
            delete this.onEnterFrame;
            this.onMoveOut();
         }
         var _loc3_ = this.obj._y + _level0.char_mc._y;
         if(_loc3_ >= _level0.land_Y)
         {
            this.obj._y = _level0.land_Y - _level0.char_mc._y;
            delete this.onEnterFrame;
            this.onLand();
         }
         this.hitCheck();
      };
   }
   function moveAim_pos(V, obj_x, obj_y, target_x, target_y)
   {
      var _loc3_ = ExtMath.angleOfLine(obj_x,obj_y,target_x,target_y);
      var Vx = V * ExtMath.cosD(_loc3_);
      var Vy = V * ExtMath.sinD(_loc3_);
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
         this.obj._x += Vx;
         this.obj._y += Vy;
         var _loc2_ = this.obj._x + _level0.char_mc._x;
         if(_loc2_ > _level0.stage_with + 100 || _loc2_ < -100)
         {
            delete this.onEnterFrame;
            this.onMoveOut();
         }
         var _loc3_ = this.obj._y + _level0.char_mc._y;
         if(_loc3_ >= _level0.land_Y)
         {
            this.obj._y = _level0.land_Y - _level0.char_mc._y;
            delete this.onEnterFrame;
            this.onLand();
         }
         this.hitCheck();
      };
   }
   function hitCheck()
   {
      if(_level0.inFreeze)
      {
         return undefined;
      }
      if(this.role.inFreeze)
      {
         return undefined;
      }
      if(this.hitValue.hurtBack == "" && this.hitValue.hurtAway == "")
      {
         return undefined;
      }
      if(this.opp.status_3 == "down" && this.hitValue.hitPos != "land")
      {
         return undefined;
      }
      var _loc3_;
      var _loc2_;
      if(this.beatArea.hitTest(this.opp.mc.body) || this.beatArea.hitTest(this.opp.mc.body2))
      {
         this.role.onHit = true;
         this.hitValue.checkTimes--;
         if(this.hitID != "" || this.hitID != undefined)
         {
            this.role.opp.status_7 = this.hitID;
         }
         else
         {
            this.role.opp.status_7 = "nohit";
         }
         this.role.doHit(this.hitValue);
         this.opp.doHurt(this.hitValue);
         if(this.hitValue.checkTimes == 0)
         {
            this.stop_hitCheck();
         }
         if(this.hitValue.isObj)
         {
            this.do_hitOpp();
         }
      }
      else if(this.hitValue.isObj)
      {
         if(this.skill_loader_opp.getNextHighestDepth() > 0)
         {
            for(_loc3_ in this.skill_loader_opp)
            {
               _loc2_ = this.skill_loader_opp[_loc3_].area;
               if(_loc2_ != this)
               {
                  if(_loc2_.hitTest(this))
                  {
                     if(this.obj_level > _loc2_.obj_level)
                     {
                        _loc2_.do_hitObj();
                     }
                     else if(this.obj_level == _loc2_.obj_level)
                     {
                        _loc2_.do_hitObj();
                        this.do_hitObj();
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
      else
      {
         this.role.onHit = false;
      }
   }
   function stop_hitCheck()
   {
      this.hitCheck = function()
      {
      };
   }
   function hitBack()
   {
      this.dir = - this.dir;
      this._parent._xscale = - this._parent._xscale;
      var _loc3_ = this.role;
      this.role = this.opp;
      this.opp = _loc3_;
      this.skill_loader = this.opp._parent.skill_loader;
      this.skill_loader_opp = _root.skill_loader;
   }
   function do_hitOpp()
   {
      if(this._parent.onHit != undefined)
      {
         this._parent.onHit();
      }
      else
      {
         this._parent.play();
      }
   }
   function do_hitObj()
   {
      if(this._parent.onHit != undefined)
      {
         this._parent.onHit();
      }
      else
      {
         this._parent.play();
      }
   }
   function onMoveOut()
   {
      if(this._parent.onMoveOut != undefined)
      {
         this._parent.onMoveOut();
      }
      else
      {
         this._parent.removeMovieClip();
      }
   }
   function onLand()
   {
      if(this._parent.onLand != undefined)
      {
         this._parent.onLand();
      }
      else
      {
         this._parent.play();
      }
   }
   function onHit()
   {
   }
   function stop()
   {
      this.mc.stop();
   }
   function play()
   {
      this.mc.play();
   }
}

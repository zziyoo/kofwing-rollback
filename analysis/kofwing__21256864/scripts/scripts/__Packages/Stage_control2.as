class Stage_control2 extends MovieClip
{
   var P1;
   var P2;
   var bgLoader;
   var bgMCArray;
   var bgObjArray;
   var bgSource;
   var bg_base;
   var char_mc;
   var onEnterFrame;
   var roleCharse_y;
   var stageH;
   var stageW;
   var stage_c;
   var stage_l;
   var stage_r;
   static var self;
   var BGloop = false;
   function Stage_control2()
   {
      super();
      Stage_control2.self = this;
      this._lockroot = true;
   }
   function init(_stageW, _stageH, _bg)
   {
      this.bgSource = _bg;
      this.stageW = _stageW;
      this.stageH = _stageH;
      this.stage_c = int(this.stageW / 2);
      this.stage_l = 0;
      this.stage_r = this.stageW;
      this.initObj();
   }
   function init2()
   {
      this.char_mc = _level0.char_mc;
      this.P1 = _level0.P1_role;
      this.P2 = _level0.P2_role;
      this.roleCharse_y = this.P1._y;
   }
   function startControl(c_target, rate_x, rate_y)
   {
      if(c_target == this.P1)
      {
         this.roleCharse_y = this.P1._y;
         this.onEnterFrame = function()
         {
            this.camera_role(this.P1,rate_x,rate_y);
         };
      }
      else if(c_target == this.P2)
      {
         this.roleCharse_y = this.P2._y;
         this.onEnterFrame = function()
         {
            this.camera_role(this.P2,rate_x,rate_y);
         };
      }
      else
      {
         this.roleCharse_y = this.P1._y >= this.P2._y ? this.P2._y : this.P1._y;
         this.onEnterFrame = function()
         {
            this.camera_center();
         };
      }
   }
   function stopControl()
   {
      delete this.onEnterFrame;
   }
   function initObj()
   {
      this.bgObjArray = this.bgSource.bgArray;
      this.bgMCArray = new Array();
      this.bgLoader = this.bgSource;
      var _loc3_ = 0;
      var _loc2_;
      var _loc5_;
      var _loc4_;
      var _loc6_;
      var _loc8_;
      var _loc7_;
      while(_loc3_ < this.bgObjArray.length)
      {
         if(this.bgObjArray[_loc3_].isBmd)
         {
            _loc2_ = this.bgObjArray[_loc3_].mc;
            _loc5_ = new flash.display.BitmapData(_loc2_._width,_loc2_._height,true,0);
            _loc5_.draw(_loc2_);
            _loc4_ = this.bgLoader.createEmptyMovieClip("bg_mc" + this.bgLoader.getNextHighestDepth(),this.bgLoader.getNextHighestDepth());
            _loc6_ = new flash.display.BitmapData(this.stageW,this.stageH,true,0);
            _loc4_.attachBitmap(_loc6_,_loc4_.getNextHighestDepth());
            _loc4_.bgBmd = _loc5_;
            _loc4_.bgBmd_show = _loc6_;
            _loc8_ = - _loc2_._x;
            _loc7_ = _loc2_._height <= this.stageH ? 0 : _loc2_._height - this.stageH;
            _loc4_.bgRec = new flash.geom.Rectangle(_loc8_,_loc7_,this.stageW,this.stageH);
            _loc4_.bgPt = new flash.geom.Point(0,0);
            _loc4_.v_rate = this.bgObjArray[_loc3_].v_rate;
            if(this.bgObjArray[_loc3_].isBase)
            {
               this.bg_base = _loc4_;
               this.bg_base.width = _loc2_._width;
            }
            _loc4_.bgRec.y0 = _loc4_.bgRec.y;
            _loc6_.copyPixels(_loc5_,_loc4_.bgRec,_loc4_.bgPt);
            this.bgMCArray.push(_loc4_);
            _loc2_.swapDepths(_loc2_._parent.getNextHighestDepth());
            _loc2_.removeMovieClip();
         }
         else
         {
            _loc4_ = this.bgObjArray[_loc3_].mc;
            _loc4_.swapDepths(this.bgLoader.getNextHighestDepth());
            _loc4_.v_rate = this.bgObjArray[_loc3_].v_rate;
            this.bgMCArray.push(_loc4_);
            _loc4_._y0 = _loc4_._y;
            if(this.bgObjArray[_loc3_].isBase)
            {
               this.bg_base = _loc4_;
               this.bg_base.width = _loc2_._width;
            }
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function resetPosY()
   {
      var _loc3_ = 0;
      var _loc2_;
      while(_loc3_ < this.bgMCArray.length)
      {
         _loc2_ = this.bgMCArray[_loc3_];
         if(_loc2_.v_rate != 0)
         {
            if(_loc2_.bgBmd)
            {
               _loc2_.bgRec.y = _loc2_.bgRec.y0;
               _loc2_.bgBmd_show.copyPixels(_loc2_.bgBmd,_loc2_.bgRec,_loc2_.bgPt);
            }
            else
            {
               _loc2_._y = _loc2_._y0;
            }
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function camera_center()
   {
      if(_level0.inFreeze)
      {
         return undefined;
      }
      if(_level0.inPause)
      {
         return undefined;
      }
      if(ZoomControl.inZoom)
      {
         return undefined;
      }
      var _loc4_;
      if(this.P1._x < this.P2._x)
      {
         _loc4_ = this.char_mc._x + this.P1._x + int((this.P2._x - this.P1._x) / 2);
      }
      else
      {
         _loc4_ = this.char_mc._x + this.P2._x + int((this.P1._x - this.P2._x) / 2);
      }
      var _loc7_ = this.stage_c - _loc4_;
      var _loc5_ = this.P1._y >= this.P2._y ? this.P2 : this.P1;
      var _loc6_ = this.roleCharse_y - _loc5_._y;
      this.roleCharse_y = _loc5_._y;
      var _loc3_ = _loc6_ * 0.2;
      if(this.char_mc._y + _loc3_ < 0)
      {
         _loc3_ -= this.char_mc._y;
      }
      var _loc2_ = int(_loc7_ >> 1);
      if(this.P1.onEgde && this.P2.onEgde)
      {
         _loc2_ = 0;
      }
      if(this.bgCheck(_loc2_))
      {
         _loc2_ = 0;
      }
      if(_loc2_ != 0)
      {
         this.char_mc._x += _loc2_;
      }
      if(_loc3_ != 0)
      {
         this.char_mc._y += _loc3_;
      }
      this.do_scroll(_loc2_,_loc3_);
   }
   function camera_role(role, rate_x, rate_y)
   {
      if(_level0.inFreeze)
      {
         return undefined;
      }
      if(_level0.inPause)
      {
         return undefined;
      }
      if(ZoomControl.inZoom)
      {
         return undefined;
      }
      var _loc4_ = this.char_mc._x + role._x;
      var _loc7_ = this.stage_c - _loc4_;
      var _loc3_ = _loc7_ * rate_x;
      var _loc6_ = this.roleCharse_y - role._y;
      this.roleCharse_y = role._y;
      var _loc2_ = _loc6_ * rate_y;
      if(this.char_mc._y + _loc2_ < 0)
      {
         _loc2_ -= this.char_mc._y;
      }
      if(_loc3_ != 0)
      {
         this.char_mc._x += _loc3_;
      }
      if(_loc2_ != 0)
      {
         this.char_mc._y += _loc2_;
      }
      if(this.bgCheck(_loc3_))
      {
         _loc3_ = 0;
      }
      this.do_scroll(_loc3_,_loc2_);
   }
   function camera_P1()
   {
      var _loc3_;
      _loc3_ = this.char_mc._x + this.P1._x;
      var _loc4_ = this.stage_c - _loc3_;
      var _loc2_ = int(_loc4_ >> 1);
      if(_loc2_ == 0)
      {
         return "over";
      }
      if(this.P1.onEgde)
      {
         return "over";
      }
      if(this.bgCheck(_loc2_))
      {
         return "over";
      }
      this.char_mc._x += _loc2_;
      this.do_scroll(_loc2_);
   }
   function camera_P2()
   {
      var _loc3_;
      _loc3_ = this.char_mc._x + this.P2._x;
      var _loc4_ = this.stage_c - _loc3_;
      var _loc2_ = int(_loc4_ >> 1);
      if(_loc2_ == 0)
      {
         return "over";
      }
      if(this.P2.onEgde)
      {
         return "over";
      }
      if(this.bgCheck(_loc2_))
      {
         return "over";
      }
      this.char_mc._x += _loc2_;
      this.do_scroll(_loc2_);
   }
   function do_scroll(_Vx, _Vy)
   {
      var _loc5_ = 0;
      var _loc2_;
      var _loc4_;
      var _loc3_;
      while(_loc5_ < this.bgMCArray.length)
      {
         _loc2_ = this.bgMCArray[_loc5_];
         if(_loc2_.v_rate != 0)
         {
            _loc4_ = _Vx * _loc2_.v_rate;
            _loc3_ = _Vy * _loc2_.v_rate;
            if(_loc2_.bgBmd)
            {
               if(_loc4_ != 0)
               {
                  _loc2_.bgRec.x -= _loc4_;
               }
               if(_loc3_ != 0)
               {
                  _loc2_.bgRec.y -= _loc3_;
               }
               _loc2_.bgBmd_show.copyPixels(_loc2_.bgBmd,_loc2_.bgRec,_loc2_.bgPt);
            }
            else
            {
               if(_loc4_ != 0)
               {
                  _loc2_._x += _loc4_;
               }
               if(_loc3_ != 0)
               {
                  _loc2_._y += _loc3_;
               }
            }
         }
         _loc5_ = _loc5_ + 1;
      }
   }
   function bgCheck(v)
   {
      if(this.bg_base.bgBmd)
      {
         if(this.bg_base.bgRec.x - v <= 0)
         {
            return true;
         }
         if(this.bg_base.bgRec.x + this.bg_base.bgRec.width - v >= this.bg_base.width)
         {
            return true;
         }
      }
      else
      {
         if(v > 0 && this.bg_base._x + v >= 0)
         {
            return true;
         }
         if(v < 0 && this.bg_base._x + this.bg_base._width + v <= this.stageW)
         {
            return true;
         }
      }
   }
}

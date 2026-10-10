class Stage_shake extends MovieClip
{
   var dir_x;
   var dir_y;
   var onEnterFrame;
   var seg;
   var shake_times;
   var shake_v;
   var shake_v0;
   var verticalTrue = true;
   var inShake = false;
   function Stage_shake()
   {
      super();
      this.shake_v0 = 15;
      this.shake_v = this.shake_v0;
      this.dir_x = 1;
      this.dir_y = 1;
      this.seg = 0;
   }
   function shakeStart(s_t, s_rage, vertical)
   {
      if(this.inShake)
      {
         delete this.onEnterFrame;
         this.seg = 0;
         _level0._y = 0;
         _level0.element_mc._y = 0;
      }
      this.shake_times = s_t;
      if(s_rage != undefined)
      {
         this.shake_v = s_rage;
      }
      else
      {
         this.shake_v = this.shake_v0;
      }
      if(this.shake_times == null)
      {
         this.shake_times = 0;
      }
      if(this.shake_times == 0)
      {
         return undefined;
      }
      if(vertical != undefined)
      {
         this.verticalTrue = vertical;
      }
      this.inShake = true;
      this.onEnterFrame = function()
      {
         if(_level0.inPause)
         {
            return undefined;
         }
         this.shake();
      };
      this.shake();
   }
   function shake()
   {
      this.seg = this.seg + 1;
      if(this.verticalTrue)
      {
         if(this.seg == 2)
         {
            _level0._y = this.shake_v;
            _level0.element_mc._y -= this.shake_v;
         }
         else if(this.seg == 3)
         {
            _level0._y = 0;
            _level0.element_mc._y = 0;
         }
         else if(this.seg == 4)
         {
            _level0._y = this.shake_v;
            _level0.element_mc._y -= this.shake_v;
         }
         else if(this.seg == 5)
         {
            this.seg = 0;
            _level0._y = 0;
            _level0.element_mc._y = 0;
            this.shake_times = this.shake_times - 1;
            if(this.shake_times <= 0)
            {
               this.shake_v -= 6;
               if(this.shake_v <= 0)
               {
                  this.shake_v = 0;
                  this.inShake = false;
                  delete this.onEnterFrame;
               }
            }
         }
      }
      else if(this.seg == 2)
      {
         _level0._x = (- this.shake_v) / 2;
         _level0.element_mc._x += this.shake_v / 2;
      }
      else if(this.seg == 3)
      {
         _level0._x = this.shake_v / 2;
         _level0.element_mc._x -= this.shake_v;
      }
      else if(this.seg == 4)
      {
         _level0._x = (- this.shake_v) / 2;
         _level0.element_mc._x += this.shake_v;
      }
      else if(this.seg == 5)
      {
         this.seg = 0;
         _level0._x = 0;
         _level0.element_mc._x = 0;
         this.shake_times = this.shake_times - 1;
         if(this.shake_times <= 0)
         {
            this.shake_v -= 6;
            if(this.shake_v <= 0)
            {
               this.shake_v = 0;
               this.inShake = false;
               delete this.onEnterFrame;
            }
         }
      }
   }
}

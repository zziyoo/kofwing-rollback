class HitCounter extends MovieClip
{
   var hits_mc;
   var offsetX;
   var hits = 0;
   function HitCounter()
   {
      super();
      this._y = 240;
      this.offsetX = 80;
      this._x = _level0.egde_min + this.offsetX;
      this._visible = false;
      var _loc4_;
      var _loc3_;
      if(_level0.glowMode)
      {
         _loc4_ = new flash.filters.GlowFilter(16711935,1,10,10,0.75,3,false,false);
         _loc3_ = new Array();
         _loc3_.push(_loc4_);
         this.filters = _loc3_;
      }
   }
   function showHits(obj)
   {
      if(_level0.glowMode)
      {
         this.hits_mc.num_mc.hits2_txt._visible = false;
      }
      if(_level0.first_attack)
      {
         _level0.first_attack = false;
         if(obj.target == _level0.P2_role)
         {
            _level0.showMsg("first_attack",_level0.stage_with - 150,200);
         }
         else
         {
            _level0.showMsg("first_attack",50,200);
         }
      }
      var _loc5_ = obj.x;
      this.hits = this.hits + 1;
      if(this.hits > 9999)
      {
         this.hits = 2;
      }
      var _loc2_;
      var _loc4_;
      if(this.hits > 1)
      {
         _loc2_ = new flash.filters.GlowFilter(16711935,1,10,10,0.75,3,false,false);
         if(this.hits >= 120)
         {
            _loc2_ = new flash.filters.GlowFilter(16711680,1,10,10,0.75,3,false,false);
            this.hits_mc.praise_mc.hits_txt.text = "Perfect";
         }
         else if(this.hits >= 100)
         {
            _loc2_ = new flash.filters.GlowFilter(16724016,1,10,10,0.75,3,false,false);
            this.hits_mc.praise_mc.hits_txt.text = "Amazing";
         }
         else if(this.hits >= 80)
         {
            _loc2_ = new flash.filters.GlowFilter(15761536,1,10,10,0.75,3,false,false);
            this.hits_mc.praise_mc.hits_txt.text = "Wonderful";
         }
         else if(this.hits >= 60)
         {
            _loc2_ = new flash.filters.GlowFilter(15628703,1,10,10,0.75,3,false,false);
            this.hits_mc.praise_mc.hits_txt.text = "Excellent";
         }
         else if(this.hits >= 40)
         {
            _loc2_ = new flash.filters.GlowFilter(15648145,1,10,10,0.75,3,false,false);
            this.hits_mc.praise_mc.hits_txt.text = "Great";
         }
         else if(this.hits >= 20)
         {
            _loc2_ = new flash.filters.GlowFilter(16444375,1,10,10,0.75,3,false,false);
            this.hits_mc.praise_mc.hits_txt.text = "Good";
         }
         else
         {
            _loc2_ = new flash.filters.GlowFilter(16711680,1,10,10,0.75,3,false,false);
            this.hits_mc.praise_mc.hits_txt.text = "";
         }
         _loc4_ = new Array();
         _loc4_.push(_loc2_);
         this.filters = _loc4_;
         this.gotoAndStop(1);
         this.hits_mc.gotoAndPlay(1);
         this.hits_mc.num_mc.hits_txt.text = this.hits;
         if(!_level0.glowMode)
         {
            this.hits_mc.num_mc.hits2_txt.text = this.hits;
         }
         if(obj.target == _level0.P2_role)
         {
            this._x = _level0.egde_max - this.offsetX;
         }
         else if(obj.target == _level0.P1_role)
         {
            this._x = _level0.egde_min + this.offsetX;
         }
         this._visible = true;
      }
   }
   function showHits_end()
   {
      if(this.hits > 1)
      {
         this.gotoAndPlay("showHits");
      }
      this.hits = 0;
   }
   function clearHits()
   {
      this.gotoAndStop(1);
      this._visible = false;
   }
}

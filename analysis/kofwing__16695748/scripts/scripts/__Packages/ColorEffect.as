class ColorEffect
{
   var MC;
   var MC_color;
   var oldColor;
   var timer_color;
   static var color_normal = {ra:"100",rb:"0",ga:"100",gb:"0",ba:"100",bb:"0",aa:"100",ab:"0"};
   static var color_white = {ra:"0",rb:"255",ga:"0",gb:"255",ba:"0",bb:"255",aa:"100",ab:"0"};
   static var color_black = {ra:"0",rb:"0",ga:"0",gb:"0",ba:"0",bb:"0",aa:"100",ab:"0"};
   function ColorEffect()
   {
   }
   static function setColor(_mc, colorType)
   {
      var _loc1_ = new Color(_mc);
      if(typeof colorType == "string")
      {
         _loc1_.setTransform(ColorEffect["color_" + colorType]);
      }
      else if(colorType instanceof Object)
      {
         _loc1_.setTransform(colorType);
      }
   }
   function colorRecover()
   {
      this.MC_color.setTransform(this.oldColor);
      clearInterval(this.timer_color);
      this.MC.inWhite = null;
      this = null;
   }
}

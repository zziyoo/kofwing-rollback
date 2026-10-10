function closeThis()
{
   this.removeMovieClip();
}
function startRoll_down()
{
   onEnterFrame = function()
   {
      if(list_mc._y > top)
      {
         endRoll();
         return undefined;
      }
      list_mc._y += v;
   };
}
function startRoll_up()
{
   onEnterFrame = function()
   {
      if(list_mc._y + list_mc._height < bottom)
      {
         endRoll();
         return undefined;
      }
      list_mc._y -= v;
   };
}
function endRoll()
{
   delete this.onEnterFrame;
}
list_mc.setMask(mask_mc);
var top = mask_mc._y;
var bottom = mask_mc._y + mask_mc._height;
var v = 3;

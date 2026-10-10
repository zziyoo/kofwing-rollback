if(_level0.glowMode)
{
   this.blendMode = "add";
}
else
{
   _visible = false;
}
var fOut = true;
this.onEnterFrame = function()
{
   if(this._alpha >= 100)
   {
      fOut = true;
   }
   else if(this._alpha <= 0)
   {
      fOut = false;
   }
   if(fOut)
   {
      this._alpha -= 1;
   }
   else
   {
      this._alpha += 1;
   }
};

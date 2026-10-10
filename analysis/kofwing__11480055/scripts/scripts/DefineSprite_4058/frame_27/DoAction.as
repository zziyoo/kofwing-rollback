var onwer = this;
if(_root.player_type == "cpu")
{
   _root.role_mc.gotoAndStop("sk_kick");
}
else
{
   key_mc8.pressFunc = function()
   {
      _root.role_mc.gotoAndStop("sk_kick");
   };
}

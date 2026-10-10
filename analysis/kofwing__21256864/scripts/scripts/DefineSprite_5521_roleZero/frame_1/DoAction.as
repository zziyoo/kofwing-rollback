stop();
var isRole = true;
var objRoleName = "Zero";
if(_level0.player_type == "trainning")
{
   return undefined;
}
if(opp._roleName == "Igniz")
{
   gotoAndStop("kcnz");
}
if(opp._roleName == "K" || opp._roleName == "Kula")
{
   gotoAndStop("kcnz2");
}
if(opp._roleName == "Nameless")
{
   gotoAndStop("kcnz3");
}
var i = Math.random();
if(i > 0.5)
{
   gotoAndStop("2");
}
this.onEnterFrame = function()
{
   a = this._y;
};

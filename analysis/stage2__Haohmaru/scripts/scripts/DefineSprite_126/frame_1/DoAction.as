stop();
var bg2 = {isBmd:false,mc:bg2_mc,v_rate:1,isBase:true};
var bg1 = {isBmd:false,mc:bg1_mc,v_rate:0.25};
var bgArray = [bg1,bg2,bg3];
_root.raining = true;
var i = Math.random();
if(i > 0.5)
{
   _root.tq = "raining";
}
else
{
   _root.tq = "";
}

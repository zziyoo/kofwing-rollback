stop();
setTimeout(function()
{
   play();
   _level0.transOut();
   _level0.showStart_txt();
   _level0.P2_role.lifeObj.d_rate = 0;
   _level0.lifeControl(_level0.P2_role.lifeObj,true);
   _level0.P1_role.lifeObj.d_rate = 0;
   _level0.lifeControl(_level0.P1_role.lifeObj,true);
}
,200);

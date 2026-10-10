stop();
mc.gotoAndStop(loginData.vsType);
var i = 0;
while(i < _obj.length)
{
   mc["txt_name" + (i + 1)].text = _obj[i].kname;
   mc["txt_score" + (i + 1)].text = _obj[i].score;
   if(loginData.vsType == 1)
   {
      mc["role" + (i + 1)].gotoAndStop(_obj[i].role);
   }
   if(loginData.vsType == 2)
   {
      var roles = _obj[i].role.split(",");
      mc["role" + (i + 1)].gotoAndStop(roles[0]);
      mc["role" + (i + 1) + "2"].gotoAndStop(roles[1]);
   }
   if(loginData.vsType == 3)
   {
      var roles = _obj[i].role.split(",");
      mc["role" + (i + 1)].gotoAndStop(roles[0]);
      mc["role" + (i + 1) + "2"].gotoAndStop(roles[1]);
      mc["role" + (i + 1) + "3"].gotoAndStop(roles[2]);
   }
   i++;
}
btn.onRelease = function()
{
   loginData.role = cb2.selectedItem.data;
   loginData.vsType = cb3.selectedItem.data;
   gotoAndPlay(2);
};

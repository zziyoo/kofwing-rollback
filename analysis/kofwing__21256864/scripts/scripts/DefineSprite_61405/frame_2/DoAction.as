num_txt.text = 0;
onEnterFrame = function()
{
   if(_root.P1_role.record_skill.length > 0)
   {
      gotoAndStop("start");
      delete this.onEnterFrame;
   }
   if(_root.P1_role.inRecord == false)
   {
      gotoAndStop("end");
      delete this.onEnterFrame;
   }
};

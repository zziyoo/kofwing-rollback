onEnterFrame = function()
{
   if(num_txt.text != 0)
   {
      combo_num = num_txt.text;
   }
   if(_root.P1_role.inRecord == false)
   {
      gotoAndStop("end");
      delete this.onEnterFrame;
   }
};

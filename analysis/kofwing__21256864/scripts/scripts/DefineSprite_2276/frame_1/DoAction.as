function prevF()
{
   prevFrame();
}
function nextF()
{
   nextFrame();
}
function showAll()
{
   _parent.prevBtn._visible = true;
   _parent.nextBtn._visible = true;
}
function showPrev()
{
   _parent.prevBtn._visible = true;
   _parent.nextBtn._visible = false;
}
function showNext()
{
   _parent.prevBtn._visible = false;
   _parent.nextBtn._visible = true;
}
function up()
{
   setting_mc._y += 5;
   getPos();
}
function down()
{
   setting_mc._y -= 5;
   getPos();
}
function getPos()
{
   if(setting_mc._y < originY - (slide_bar.slideBar_bg._height - slide_bar.slideBar._height))
   {
      setting_mc._y = originY - (slide_bar.slideBar_bg._height - slide_bar.slideBar._height);
   }
   else if(setting_mc._y > originY)
   {
      setting_mc._y = originY;
   }
   slide_bar.slideBar._y = originY - setting_mc._y;
}
stop();
var t = 0;
this.onEnterFrame = function()
{
   t++;
   if(t > 10 && Key.isDown(_level0.key_P1[0].b))
   {
      t = 0;
      prevF();
   }
   if(Key.isDown(_level0.key_P1[0].u))
   {
      up();
   }
   if(t > 10 && Key.isDown(_level0.key_P1[0].f))
   {
      t = 0;
      nextF();
   }
   if(Key.isDown(_level0.key_P1[0].d))
   {
      down();
   }
   if(t > 10 && Key.isDown(_level0.key_P2[0].b))
   {
      t = 0;
      prevF();
   }
   if(Key.isDown(_level0.key_P2[0].u))
   {
      up();
   }
   if(t > 10 && Key.isDown(_level0.key_P2[0].f))
   {
      t = 0;
      nextF();
   }
   if(Key.isDown(_level0.key_P2[0].d))
   {
      down();
   }
};

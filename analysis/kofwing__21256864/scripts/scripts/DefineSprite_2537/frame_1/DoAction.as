function init(_keyObj)
{
   keyObj = _keyObj;
   this.onKeyDown = mode_select;
}
function mode_select()
{
   if(Key.isDown(keyObj.u) || Key.isDown(keyObj.d))
   {
      if(option == 0)
      {
         option = 1;
      }
      else
      {
         option = 0;
      }
      _level0.select_snd.start();
      move_select();
   }
   if(Key.isDown(keyObj.p) || Key.isDown(keyObj.k) || Key.isDown(keyObj.p_l) || Key.isDown(keyObj.k_l))
   {
      select();
   }
}
function move_select()
{
   select_mc._y = 8 + 72 * counter + 36 * option;
}
function select()
{
   _level0.ok_snd.start();
   this["selectMode" + counter] = option;
   if(counter == 2)
   {
      _level0.ok_snd.start();
      Key.removeListener(this);
      callBack_selectEnd();
      return undefined;
   }
   counter++;
   option = 0;
   move_select();
}
var selectMode0;
var selectMode1;
var selectMode2;
var counter = 0;
var option = 0;
Key.addListener(this);

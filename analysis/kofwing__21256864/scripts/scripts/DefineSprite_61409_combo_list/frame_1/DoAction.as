function get_data()
{
   my_list.dataProvider = _level0.comboRecord_array;
   my_list.selectedIndex = my_list.length - 1;
}
function delete_data()
{
   _level0.comboRecord_array.splice(my_list.selectedIndex,1);
   get_data();
}
function clear_data()
{
   _level0.comboRecord_array = [];
   my_list.removeAll();
}
function save_data()
{
   if(_level0.comboRecord_current == undefined)
   {
      return undefined;
   }
   _level0.comboRecord_array.push(_level0.comboRecord_current);
   _level0.comboList_mc.get_data();
   _level0.saveCombo();
   if(_level0.menu_bottom_mc.btn_3._currentframe == 1)
   {
      _level0.menu_bottom_mc.btn_3.gotoAndStop(2);
   }
}
function apply_data()
{
   _level0.comboIndex = my_list.selectedIndex;
}
get_data();

tq = "";
createEmptyMovieClip("char_mc",depth_char);
if(!loading)
{
   P1_mc = char_mc.attachMovie("role_" + charSelect_P1,"P1_mc",depth_P1);
   P2_mc = char_mc.attachMovie("role_" + charSelect_P2,"P2_mc",depth_P2);
   P1_mc._lockroot = true;
   P2_mc._lockroot = true;
   checkOutRole();
}

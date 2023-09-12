<?php
//https://www.json.cn/runcode/run_php/
$cnt=fgets(STDIN);
$res=[];
for($i=0;$i<intval($cnt);$i++){
  $dat=explode(" ",fgets(STDIN));
  $iM=intval($dat[0]);
  $iK=intval($dat[1]);
  $sR=trim($dat[2]);
  if($sR=="n"){
    //对方输点规律($iK+1)*n
    $res[]=fmod($iM,$iK+1);
  }else{
    //对方输点规律1+($iK+1)*n
    $res[]=fmod($iM-1,$iK+1);
  }
}
fwrite(STDOUT,implode(" ",$res));
?>

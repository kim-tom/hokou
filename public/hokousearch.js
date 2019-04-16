var xhr = new XMLHttpRequest();

function search()
{
  grade=document.getElementById("grade").value;
  xhr.onreadystatechange=checkStatus;
  xhr.open('GET','/hokous/'+grade,true);
  xhr.responseType='json';
  xhr.send(null);
}

function checkStatus()
{
  s="";

  if((xhr.readyState ==4)&&(xhr.status==200)){
    a=xhr.response;
    s="全部で"+ a.totalItems +"件あります。<p>";
    if(Number(a.totalItems)>0){
      s=s+"<table border=1>";
      s=s+ "<tr><th>クラス</th><th>授業</th><th>補講日</th><th>休講日</th><th>教員</th><th>備考</th></tr>";
      for(i=0;i<a.totalItems; i++)
      {
        s=s+"<tr>";

        s=s+"<td>"+a.hokous[i].grade+"の"+a.hokous[i].dptmnt+"</td>";
        s=s+"<td>"+a.hokous[i].subject +"</td>";
        s=s+"<td>"+a.hokous[i].date_ex+" "+a.hokous[i].koma_ex+"コマ</td>";
        s=s+"<td>"+a.hokous[i].date_rest+" "+a.hokous[i].koma_rest+"コマ</td>";
        s=s+"<td>"+a.hokous[i].teacher +"</td>";
        s=s+"<td>"+a.hokous[i].bikou +"</td>";

        s=s+"</tr>";
      }
      s=s+"</table>";
    }
  }
  else if(xhr.readyState ==4){
    alert("xhr.status="+xhr.status);
  }
  document.getElementById("results").innerHTML=s;
}

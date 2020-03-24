#!/bin/bash -x 
declare -A storeing_Wages 
echo "Welcome to employee wage computation"
function Check_Attend()
{
     attend=$((RANDOM%2))
     case $attend in
     0) 
         echo "0" ;;
     1) 
         echo "1" ;;
 
     esac
}

function gethour()
{
    val="$( Check_Attend $(()) )"
    if [ $val -eq 0 ]
    then
  	 val1=$((RANDOM%2))
	 case $val1 in 
  	 0)
	   	hours=8
	      echo $hours ;;
    1)	
	   	hours=4
		   echo $hours ;;
    esac
    fi
}


function Check_Employee_Wage()
{

    val=$( gethour $(()) )
    Emp_Daily_Wages=$((20*val))
    echo $Emp_Daily_Wages

}

function Calculate_Wage_For_Month()
{
     count=0
     hour=0
     calculatinghour=0
     total_wage=1
  while [[ $count -le 20 ]] && [[ $hour -le 100 ]]
  do
       hour=$( gethour $(()) )
       calculatinghour=$(( $calculatinghour + hour ))
       res=$( Check_Employee_Wage $(()) )
       total_wage=$(( $total_wage + res ))
       storeing_Wages[$count]=$res
       ((count++))
       if [ $count -eq 20 ]
       then
            break;
       fi
       done
             echo "total wages are:$total_wage"
             echo "total days are:${!storeing_Wages[@]}"
             echo "daily wages are:${storeing_Wages[@]}"

 }
Calculate_Wage_For_Month


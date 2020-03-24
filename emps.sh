#!/bin/bash 
declare -A storeing_Wages 
echo "Welcome to employee wage computation"
function Check_Attend()
{
     Attend=$((RANDOM%2))
     case $Attend in
     0) 
         echo "0" ;;
     1) 
         echo "1" ;;
 
     esac
}

function GetHour()
{
    Val="$( Check_Attend $(()) )"
    if [ $Val -eq 0 ]
    then
  	 Val1=$((RANDOM%2))
	 case $Val1 in 
  	 0)
	   	Hours=8
	      echo $Hours ;;
    1)	
	   	Hours=4
		   echo $Hours ;;
    esac
    fi
}


function Check_Employee_Wage()
{

    Val=$( GetHour $(()) )
    Emp_Daily_Wages=$((20*Val))
    echo $Emp_Daily_Wages

}

function Calculate_Wage_For_Month()
{
     Count=0
     Hour=0
     CalculatingHour=0
     Total_Wage=1
  while [[ $Count -le 20 ]] && [[ $Hour -le 100 ]]
  do
       Hour=$( GetHour $(()) )
       CalculatingHour=$(( $CalculatingHour + Hour ))
       Res=$( Check_Employee_Wage $(()) )
       Total_Wage=$(( $Total_Wage + Res ))
       Storeing_Wages[$Count]=$Res
       ((Count++))
       if [ $Count -eq 20 ]
       then
            break;
       fi
       done
             echo "total wages are:$Total_Wage"
             echo "total days are:${!Storeing_Wages[@]}"
             echo "daily wages are:${Storeing_Wages[@]}"

 }
Calculate_Wage_For_Month


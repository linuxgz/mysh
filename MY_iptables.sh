#!/bin/bash
#选择执行

#security -->raw-->mangle-->nat-->filter
#declare -A bar=([r]=red [green]=g [123]=88)
declare -A tables=([1]=raw [2]=mangle [3]=nat [4]=filter)
select table_choices in ${tables[@]} ;do
	echo $REPLY
	echo ${table_choices}
case $REPLY in
	1)
		echo "iptables -t ${table_choices}"
		Step_table="iptables -t ${table_choices}"
	;;
	*)
		echo "over"
	;;
esac
break
done
echo $Step_table







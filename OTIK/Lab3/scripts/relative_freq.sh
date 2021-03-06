IFS=$'\n'
FILENAME=$1

RAW_FREQUENCY=$(./freq.sh $FILENAME)
IFS=$' '
FREQUENCY=$( echo $RAW_FREQUENCY | sed -r '$d' ) #| sed -r '$d' )

SYM_COUNT=$( echo $RAW_FREQUENCY | tail -n1 )

echo '|Относительная частота|Байт|'
echo '|---------------------|----|'
echo $FREQUENCY | awk -v sc=$SYM_COUNT '{print "|", $1/sc,"\t|", $2 , "|"}'

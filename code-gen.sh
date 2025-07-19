agrs=''
if [[ $1 == '-f' ]]
then
    agrs='--delete-conflicting-outputs'
fi
fvm flutter pub run build_runner build ${agrs}
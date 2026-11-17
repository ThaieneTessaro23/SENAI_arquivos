cd %USERPROFILE%\Desktop
mkdir SENAI_CMD
cd SENAI_CMD
echo Serviço Nacional de Aprendizagem Industrial >
exemplo.txt
echo SESI TAMBAÚ >> exemplo.txt
type exemplo.txt
copy exemplo.txt exemplo_backup.txt
dir
ren exemplo_backup.txt backup_final.txt
dir
mkdir Backup
move backup_final.txt Backup
cd Backup
dir
cd ..
findstr "Aprendizagem" Backup\backup_final.txt
pause
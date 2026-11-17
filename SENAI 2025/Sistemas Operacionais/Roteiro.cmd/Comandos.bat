cd desktop
mkdir "SENAI_CMD"
echo  "Serviço Nacional de Aprendizagem Industrial" >exemplo.txt
echo SESI >> exemplo.txt
type exemplo.txt
copy exemplo.txt exemplo_backup.txt
dir
ren exemplo_backup.txt backup_final.txt
dir
cd SENAI_CMD
mkdir Backup
cd..
move backup_final.txt "c:\Users\Thaiene Tessaro\desktop\SENAI_CMD\Backup\"
cd SENAI_CMD
cd Backup
dir
cd..
cd..
pause